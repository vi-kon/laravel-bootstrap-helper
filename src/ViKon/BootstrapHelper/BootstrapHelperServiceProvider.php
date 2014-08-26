<?php namespace ViKon\BootstrapHelper;

use Illuminate\Foundation\AliasLoader;
use Illuminate\Support\ServiceProvider;

class BootstrapHelperServiceProvider extends ServiceProvider
{

    /**
     * Indicates if loading of the provider is deferred.
     *
     * @var bool
     */
    protected $defer = false;

    /**
     * Bootstrap the application events.
     *
     * @return void
     */
    public function boot()
    {
        $this->package('vi-kon/bootstrap-helper');

        $this->app['bs-modal'] = $this->app->share(function ()
            {
                return new BootstrapModal();
            }
        );
        $this->app->booting(function ()
            {
                $loader = AliasLoader::getInstance();
                $loader->alias('BootstrapModal', '\ViKon\BootstrapHelper\Facades\BootstrapModal');
            }
        );
    }

    /**
     * Register the service provider.
     *
     * @return void
     */
    public function register()
    {
        //
    }

    /**
     * Get the services provided by the provider.
     *
     * @return array
     */
    public function provides()
    {
        return array();
    }
}
