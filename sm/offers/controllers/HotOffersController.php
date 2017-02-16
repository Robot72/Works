<?php

namespace app\modules\main\controllers;

use Yii;
use yii\web\Controller;
use app\modules\smobjects\models\Objects;

class HotOffersController extends Controller
{
    public function actionIndex()
    {
        $models = Objects::find()
                ->where(['is_hot' => true])
                ->all();
        
        return $this->render('index', [
            'models' => $models,
        ]);
    }
}

?>