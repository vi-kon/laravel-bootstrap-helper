<?php


namespace ViKon\BootstrapHelper\Facades;

use Illuminate\Support\Facades\Facade;

/**
 * Class BootstrapModal
 *
 * @package ViKon\BootstrapHelper\Facades
 */
class BootstrapModal extends Facade
{
    /**
     * @return string
     */
    protected static function getFacadeAccessor()
    {
        return 'bs-modal';
    }
}