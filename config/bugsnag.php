<?php
/**
 * Bugsnag plugin for Craft CMS 3.x
 *
 * Log Craft errors/exceptions to Bugsnag.
 *
 * @link      https://superbig.co
 * @copyright Copyright (c) 2017 Superbig
 */

return [
    'enabled'             => getenv('BUGSNAG_IS_ENABLED'),
    'serverApiKey'        => getenv('BUGSNAG_SERVER_API_KEY'),
    'blacklist'            => [
        [
            'label' => '404 errors etc',
            'class' => '\yii\web\NotFoundHttpException',
        ],
    ],
];