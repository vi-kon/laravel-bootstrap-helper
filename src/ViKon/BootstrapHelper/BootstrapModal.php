<?php


namespace ViKon\BootstrapHelper;

use Illuminate\View\View;

class BootstrapModal
{

    /**
     * @param string $title   alert title
     * @param string $message alert message
     *
     * @return \Illuminate\View\View
     */
    public function alertInfo($title, $message)
    {
        return $this->alert('info', $title, $message);
    }

    /**
     * @param string $title   alert title
     * @param string $message alert message
     *
     * @return \Illuminate\View\View
     */
    public function alertSuccess($title, $message)
    {
        return $this->alert('success', $title, $message);
    }

    /**
     * @param string $title   alert title
     * @param string $message alert message
     *
     * @return \Illuminate\View\View
     */
    public function alertWarning($title, $message)
    {
        return $this->alert('warning', $title, $message);
    }

    /**
     * @param string $title   alert title
     * @param string $message alert message
     *
     * @return \Illuminate\View\View
     */
    public function alertDanger($title, $message)
    {
        return $this->alert('danger', $title, $message);
    }

    /**
     * @param string $type    alert type (info, success, warning, danger)
     * @param string $title   alert title
     * @param string $message alert message
     *
     * @return \Illuminate\View\View
     */
    public function alert($type, $title, $message)
    {
        return \View::make('bootstrap-helper::ajax/modal-alert')
                    ->with('type', $type)
                    ->with('title', $title)
                    ->with('message', $message);
    }

    /**
     * @param \Illuminate\View\View $view    response content
     * @param bool                  $success form post is successful or not
     * @param mixed[]               $data    additional JSON data
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function formResponse(View $view, $success = true, array $data = array())
    {
        return \Response::json(array_merge($data, array(
            'success' => $success,
            'content' => $view->render(),
        )));
    }
}