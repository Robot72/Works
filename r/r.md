Project structure
<pre>
|
|_application
  |_frontend
    |_pages - modules
      |_pg_name_module
        |_controllers
        | |_pg_name.php - the name of the controller
        |_helpers
          |_name_helper.php - the name of the helper. It is JS-file. The file starts with this codes: <script src="good.js"></script>


</pre>

Feature of the model-class. It allows add json response for methods. The methods will be execute function of the action controller's. To do http-request may at the url-address: '/ajax/module/method'. For the feature need implement follow a method:
<pre>
public function index($mname)
{
    $this->mname = $mname;
}
</pre>

Additional methods that I added within a controller for work with json-response.
<pre>
        //Methods for work with ajax
        public function responseJson( $data )
        {
            echo json_encode( $this->prepare_data( $data ) );
            die();
        }

        public function prepare_data( $param )
        {
            header('Content-type: text/html ; charset=utf-8');
            $result=false;
            if(is_array( $param ))
            {
                foreach ($param as $key=>$row)
                {
                    $result[$key]=$this->prepare_data($row);
                }
            } else {
                //$result=iconv('windows-1251', 'utf-8', $param);
                $result=$param;
            }
            return ($result);
        }
</pre>

Include js library. Type in view:
<pre>
$this->tp->load_helper( 'moment' );
</pre>

Type within helper:
<pre>
<script type="text/javascript" src="/js/moment.js"></script>
</pre>
