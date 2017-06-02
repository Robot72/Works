<?php

namespace app\modules\unloader\components;

use Yii;

class KufarComponent
{
        private $models;

        public function __construct($models)
        {
                $this->models = $models;
        }

        public static function getArea($gorod, $region = 5)
        {
                if ($gorod == 'Минск' || $gorod == 'минск') {
                        return 22;
                } else if ($gorod == 'Борисов' || $gorod == 'борисов'){
                        return 15;
                } else if ($region == 1) {//Brestkaya
                        if ($gorod == 'Брест') {
                            return 1;
                        } else if($gorod == 'Кобрин') {
                            return 2;
                        } else if($gorod == 'Лунинец') {
                            return 3;
                        } else if($gorod == 'Пинск') {
                            return ;
                        } else if($gorod == 'Барановичи') {
                            return 37;
                        } else if($gorod == 'Береза') {
                            return 38;
                        } else if($gorod == 'Ганцевичи') {
                            return 48;
                        } else if($gorod == 'Дрогичин') {
                            return 49;
                        } else if($gorod == 'Жабинка') {
                            return 50;
                        } else if($gorod == 'Иваново') {
                            return 51;
                        } else if($gorod == 'Ивацевичи') {
                            return 52;
                        } else if($gorod == 'Каменец') {
                            return 53;
                        } else if($gorod == 'Ляховичи') {
                            return 54;
                        } else if($gorod == 'Малорита') {
                            return 55;
                        } else if($gorod == 'Пружаны') {
                            return 56;
                        } else if($gorod == 'Столин') {
                            return 57;
                        } else if($gorod == 'Белоозёрск') {
                            return 123;
                        } else {
                            return 31;
                        }
                } else if ($region == 2) {//Gomelskaya
                        if ($gorod == 'Гомель') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        } else if ($gorod == '') {

                        }

                }
        }

        public static function getRegion($gorod, $oblast = 2)
        {
                if($gorod == 'Минск' || $gorod == 'минск') {                        return 7;
                } else if ($oblast == 6) { //Brestskaya
                        return 1;
                } else if ($oblast == 5) { //Gomelskaya
                        return 2;
                } else if ($oblast == 4) { //Grodnenskaya
                        return 3;
                } else if ($oblast == 7) { //Mogilevskaya
                        return 4;
                } else if ($oblast == 2) { //Minskaya
                        return 5;
                } else if ($oblast == 3) { //Vitebskaya
                        return 6;
                }
        }

        public function getUnload()
        {
                $dom = new \DOMDocument('1.0', 'utf-8');
        function cdata($data) {
            $startCdata = '<![CDATA[ ';
            $endCdata = ' ]]>';
            return $startCdata . $data . $endCdata;
        }
        $dom->formatOutput = true;
        $uedb = $dom->createElement('uedb');
        $dom->appendChild($uedb);

        $records = $dom->createElement('records');
        $uedb->appendChild($records);

        //echo'<pre>';print_r($models);echo'</pre>';die();

        foreach ($this->models as $model) {
            if(empty($model['cena'])) {
                continue;
            }

            $record = $dom->createElement('record');

            $unid = $dom->createElement('unid', $model['nomer_po_baze'] );
            $record->appendChild($unid);

            $category = $dom->createElement('category', '1000');
            $record->appendChild($category);

            $type = $dom->createElement('type', 'sell');
            $record->appendChild($type);

            $subject = $dom->createElement('subject', cdata( $this->getSubject($model) ));
            $record->appendChild($subject);

            $body = $dom->createElement('body', cdata($model['kommentarij']));
            $record->appendChild($body);

            $area = $dom->createElement('area', self::getArea($model['gorod']));
            $record->appendChild($area);

            $region = $dom->createElement('region', self::getRegion($model['gorod']));
            $record->appendChild($region);

            $remuneration_type = $dom->createElement('remuneration_type', 1);
            $record->appendChild($remuneration_type);

            $contact_person = $dom->createElement('contact_person', cdata($model['imia_publichnoe']));
            $record->appendChild($contact_person);

            $phone = $dom->createElement('phone', cdata($model['telefony_publichnije']));
            $record->appendChild($phone);

            $link = $dom->createElement('link', cdata('https://www.m2.by/realty?id=' . $model['nomer_po_baze']));
            $record->appendChild($link);

            $price = $dom->createElement('price', $model['cena']);
            $record->appendChild($price);

            $currency = $dom->createElement('currency', 'USD');
            $record->appendChild($currency);

            $photos = $dom->createElement('photos');
            $record->appendChild($photos);

            $images = explode(', ', $model['https_photos']);            if( is_array($images) && count($images) > 0 ) {
                foreach($images as $image) {
                    $photo = $dom->createElement('photo');
                    $picture = $dom->createAttribute('picture');
                    $picture->value = $image;
                    $photo->appendChild($picture);
                    $photos->appendChild($photo);
                }
            }

            $records->appendChild($record);
        }

                return $dom->saveXML();
        }

        private function getSubject($model)
    {
        $text = "";
        if( $model['objekt'] == 1 )
        {
            switch ($model['komnat_vsego'])
            {
                case 1:
                    $text.="Однокомнатная ";
                    break;
                case 2:
                    $text.="Двухкомнатная ";
                    break;
                case 3:
                    $text.="Трехкомнатная ";
                    break;
                case 4:
                    $text.="Четырехкомнатная ";
                    break;
                case 5:
                    $text.="Пятикомнатная ";
                    break;
                case 6:
                    $text.="Шестикомнатная ";
                    break;
                case 7:
                    $text.="Семикомнатная ";
                    break;
                case 8:
                    $text.="Восьмикомнатная ";
                    break;
                case 9:
                    $text.="Девятикомнатная ";
                    break;
                case 10:
                    $text.="Десятикомнатная ";
                    break;
                default:
                    break;
            }

            $text.="квартира в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
                    $text .= "Одна комната";
                    break;
                case 2:
                    $text .= "Две комнаты";
                    break;
                case 3:
                    $text .= "Три комнаты";
                    break;
                case 4:
                    $text .= "Четыре комнаты";
                    break;
                case 5:
                    $text .= "Пять комнат";
                    break;
                case 6:
                    $text .= "Шесть комнат";
                    break;
                case 7:
                    $text .= "Семь комнат";
                    break;
                case 8:
                    $text .= "Восемь комнат";
                    break;
                case 9:
                    $text .= "Девять комнат";
                    break;
                case 10:
                    $text .= "Десять комнат";
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
            $text.="Дом в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
            $text.="Дача в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
            $text.="Коттедж в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
            $text.="Участк в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
            $text.="Гараж в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
        }  else if( $model['objekt'] >= 8 ) {
            $text.="Коммерческая недвижимость в " . $model['gorod_kod'] . ' ' . $model['gorod'];
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
