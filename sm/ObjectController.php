<?php

namespace app\modules\unloader\controllers;

use Yii;
use yii\web\Controller;
use yii\web\Response;
use app\modules\smobjects\models\Objects;

/**
 * Выгрузка объектов в различных популярных форматах ObjectsController
 */
class ObjectsController extends Controller
{

    public function actionS()
    {
        Yii::$app->response->format = Response::FORMAT_XML;
        $dom = new \DOMDocument('1.0', 'utf-8');
        $dom->formatOutput = true;
        $rootElement = $dom->createElement('realty-feed');
        $xmlns = $dom->createAttribute('xmlns');
        $xmlns->value = 'http://webmaster.yandex.ru/schemas/feed/realty/2010-06';
        $rootElement->appendChild($xmlns);
        $dom->appendChild($rootElement);

        $generationDate = $dom->createElement('generation-date', date(\DateTime::ATOM));
        $rootElement->appendChild($generationDate);

        $models = $this->findObjects();
        //echo'<pre>';print_r($models);echo'</pre>';die();

        foreach ($models as $model) {
            if( empty($model['cena']) ) {
                continue;
            }

            $offer = $dom->createElement('offer');
            $internalId = $dom->createAttribute('internal-id');
            $internalId->value = $model['nomer_po_baze'];
            $offer->appendChild($internalId);

            $type = $dom->createElement('type', 'продажа');
            $offer->appendChild($type);

            $value = $model['objekt'] == 6 || $model['objekt'] == 7 || $model['objekt'] == 8 ? '' : 'жилая';
            $propertyType = $dom->createElement('property-type', $value);
            $offer->appendChild($propertyType);

            $url = $dom->createElement('url', 'https://www.m2.by/realty?id=' . $model['nomer_po_baze'] );
            $offer->appendChild($url);

            $datetime = new \DateTime( $model['data_vremya_vnesenija'] );
            $creationDate = $dom->createElement('creation-date', $datetime->format(\DateTime::ATOM));
            $offer->appendChild($creationDate);

            $datetime2 = new \DateTime( $model['data_vremya_izmenenija'] );
            $lastUpdateDate = $dom->createElement('last-update-date', $datetime2->format(\DateTime::ATOM));
            $offer->appendChild($lastUpdateDate);

            $location = $dom->createElement('location');
            $offer->appendChild($location);

            $country = $dom->createElement('country', 'Беларусь');
            $location->appendChild($country);

            $localityName = $dom->createElement('locality-name', $model['gorod_kod'] . ' ' . $model['gorod']);
            $location->appendChild($localityName);

            $address = $model['ulica_kod'] . ' ' . $model['ulica'];
            $address .= !empty( $model['dom'] ) ? ", " . $model['dom'] : '';
            $address .= !empty( $model['korpus'] ) ? ", к. " . $model['korpus'] : '';
            $address = $dom->createElement('address', $address);
            $location->appendChild($address);

            $metroName = $dom->createElement('name', $model['stancija_metro']);
            $metro =  $dom->createElement('metro');
            $metro->appendChild($metroName);
            $location->appendChild($metro);

            $salesAgent = $dom->createElement('sales-agent');
            $offer->appendChild($salesAgent);

            $name = $dom->createElement('name', $model['imia_publichnoe']);
            $salesAgent->appendChild($name);

            $phones = explode(',', $model['telefony_publichnije']);
            if( is_array($phones) && count($phones) > 0 ) {
                foreach($phones as $phonenumber) {
                    $phone = $dom->createElement('phone', $phonenumber);
                    $salesAgent->appendChild($phone);
                }
            }

            $category = $dom->createElement('category', 'agency');
            $salesAgent->appendChild($category);

            $organization = $dom->createElement('organization', 'Квадратный метр');
            $salesAgent->appendChild($organization);

            $url = $dom->createElement('url', 'www.m2.by');
            $salesAgent->appendChild($url);

            $photo = $dom->createElement('photo', 'http://test.m2.by/images/logo-dark.png');
            $salesAgent->appendChild($photo);

            $price = $dom->createElement('price');
            $offer->appendChild($price);

            $value = $dom->createElement('value', $model['cena']);
            $price->appendChild($value);

            $currency = $dom->createElement('currency', 'USD');
            $price->appendChild($currency);

            $description = $dom->createElement('description', $model['kommentarij']);
            $offer->appendChild($description);

            //Everything area
            if($model['objekt'] == 1 || $model['objekt'] == 2 || $model['objekt'] == 3 || $model['objekt'] == 4 || $model['objekt'] == 5 || $model['objekt'] == 8) {
                $area = $dom->createElement('area');
                $offer->appendChild($area);

                $value = $dom->createElement('value', $model['ploshad_o']);
                $area->appendChild($value);

                $unit = $dom->createElement('unit', 'кв. м');
                $area->appendChild($unit);

                $buildingType = $dom->createElement('building-type', $model['tip_doma']);
                $offer->appendChild($buildingType);

                $builtYear = $dom->createElement('built-year', $model['god_postrojki']);
                $offer->appendChild($builtYear);
            }

            if($model['objekt'] == 6 || $model['objekt'] == 3 || $model['objekt'] == 5) {
                if(! empty($model['ploshad_u']) ) {
                    $lotArea = $dom->createElement('lot-area');
                    $offer->appendChild($lotArea);

                    $value = $dom->createElement('value', $model['ploshad_u']);
                    $lotArea->appendChild($value);

                    $unit = $dom->createElement('unit', 'кв. м');
                    $lotArea->appendChild($unit);
                }
            }

            if($model['objekt'] == 1 || $model['objekt'] == 2 || $model['objekt'] == 3 || $model['objekt'] == 4 || $model['objekt'] == 5) {

                //Living
                $livingSpace = $dom->createElement('living-space');
                $offer->appendChild($livingSpace);

                $value = $dom->createElement('value', $model['ploshad_zh']);
                $livingSpace->appendChild($value);

                $unit = $dom->createElement('unit', 'кв. м');
                $livingSpace->appendChild($unit);

                //Kitchen
                $kitchenSpace = $dom->createElement('kitchen-space');
                $offer->appendChild($kitchenSpace);

                $value = $dom->createElement('value', $model['ploshad_k']);
                $kitchenSpace->appendChild($value);

                $unit = $dom->createElement('unit', 'кв. м');
                $kitchenSpace->appendChild($unit);

                $rooms = $dom->createElement('rooms', $model['komnat_vsego']);
                $offer->appendChild($rooms);

                $newFlatValue = empty($model['novostrojka']) ? false : $model['novostrojka'];
                $newFlat = $dom->createElement('new-flat', $model['novostrojka']);
                $offer->appendChild($newFlat);

                if($model['balkon'] == 'лоджия' || $model['balkon'] == 'балкон') {
                    $balcony = $dom->createElement('balkony', $model['balkon']);
                    $offer->appendChild($balcony);
                }

                if($model['sanuzel'] == 'совмещенный' || $model['sanuzel'] == 'раздельный' ) {
                    $bathroomUnit = $dom->createElement('bathroom-unit', $model['sanuzel']);
                    $offer->appendChild($bathroomUnit);
                }

                $floor = $dom->createElement('floor', $model['jetazh']);
                $offer->appendChild($floor);

                $floorsTotal = $dom->createElement('floors-total', $model['jetazhnost']);
                $offer->appendChild($floorsTotal);
            }

            if($model['objekt'] == 3 || $model['objekt'] == 5) {
                $gasValue = $model['gaz'] == 'есть' ? true : false;
                $gasSupply = $dom->createElement('gas-supply', $gasValue);
                $offer->appendChild($gasSupply);

                $toiletValue = $model['udobstva'] == 'с/у на улице' ? 'на улицу' : 'в доме';
                $toilet = $dom->createElement('toilet', $toiletValue);
                $offer->appendChild($toilet);

                $waterSupplyValue = $model['voda'] == 'есть' ? true : false;
                $waterSupply = $dom->createElement('water-supply', $waterSupplyValue);
                $offer->appendChild($waterSupply);

                $heatingSupplyValue = $model['teplo'] == 'газ' || $model['teplo'] == 'печное' || $model['teplo'] == 'паровое' ? true : false;
                $heatingSupply = $dom->createElement('heating-supply', $heatingSupplyValue);
                $offer->appendChild($heatingSupply);
            }


            if($model['objekt'] == 3 || $model['objekt'] == 5 || $model['objekt'] == 6 || $model['objekt'] == 7) {
                ;//$svet
            }

            if($model['objekt'] == 1) {
                $category = $dom->createElement('category', 'квартира');
                $offer->appendChild($category);
            }

            //Rooms
            if($model['objekt'] == 2) {
                $roomsOffered = $dom->createElement('rooms-offered', $model['komnat_sdaetsja']);
                $offer->appendChild($roomsOffered);

                $category = $dom->createElement('category', 'комната');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 3) {
                $category = $dom->createElement('category', 'дом');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 4) {
                $category = $dom->createElement('category', 'дача');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 5) {
                $category = $dom->createElement('category', 'коттедж');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 6) {
                $category = $dom->createElement('category', 'участок');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 7) {
                $category = $dom->createElement('category', 'гараж');
                $offer->appendChild($category);
            }

            if($model['objekt'] == 8) {
                $category = $dom->createElement('category', 'commercial');
                $offer->appendChild($category);
            }

            $images = explode(', ', $model['photos_services']);
            if( is_array($images) && count($images) > 0 ) {
                foreach($images as $image) {
                    $img = $dom->createElement('image', $image);
                    $offer->appendChild($img);
                }
            }

            $rootElement->appendChild($offer);
        }

        echo $dom->saveXML();
    }

    private function findObjects()
    {
        return (new \yii\db\Query)->from('object')
                ->innerJoin('objects_contact_public', 'objects_contact_public.nomer_po_baze = object.nomer_po_baze')
                ->all();
    }

    private function generationTitle($model)
    {
        $text = "Продажа ";
        if( $model['objekt'] == 1 )
        {
            switch ($model['komnat_vsego'])
            {
                case 1:
                    $text.="однокомнатной ";
                    break;
                case 2:
                    $text.="двухкомнатной ";
                    break;
                case 3:
                    $text.="трехкомнатной ";
                    break;
                case 4:
                    $text.="четырехкомнатной ";
                    break;
                case 5:
                    $text.="пятикомнатной ";
                    break;
                case 6:
                    $text.="шестикомнатной ";
                    break;
                case 7:
                    $text.="семикомнатной ";
                    break;
                default:
                    break;
            }

            $text.="квартиры в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 2 ) {
            switch($model['komnat_sdaetsja']) {
                case 1:
                    $text .= "комнаты";
                    break;
                case 2:
                    $text .= "двух комнат";
                    break;
                case 3:
                    $text .= "трех комнат";
                    break;
                case 4:
                    $text .= "четырех комнат";
                    break;
                case 5:
                    $text .= "пяти комнат";
                    break;
                case 6:
                    $text .= "шести комнат";
                    break;
                case 7:
                    $text .= "семи комнат";
                    break;
            }

            $text .= " в " . $model['gorod_kod'] . ' ' . $model['gorod'] . " по адресу" ;

            if(! empty($model['ulica']))
            {
                $text .= " " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 3 ) {
            $text.="дома в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        } else if( $model['objekt'] == 4 ) {
            $text.="дачи в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 5 ) {
            $text.="коттеджа в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 6 ) {
            $text.="участка в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 7 ) {
            $text.="гаража в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }  else if( $model['objekt'] == 8 ) {
            $text.="нежилого помещения в " . $model['gorod_kod'] . ' ' . $model['gorod'];
            if(! empty($model['mikrorajon']) )
            {
                $text .= " (м-н " . $model['mikrorajon'] . ")";
            }
            if(! empty($model['ulica']))
            {
                $text .= ", " . $model['ulica_kod'] . ' ' . $model['ulica'];
            }
            if(! empty($model['dom']))
            {
                $text .= ", " . $model['dom'];
            }
            if(! empty($model['korpus'])) {
                $text .= ", к. " . $model['korpus'];
            }
        }


        return $text;

    }
}
