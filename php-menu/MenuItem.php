<?php

abstract class MenuItem 
{
	
	public $label;
	
	public function __construct($label)
	{
		$this->label = $label;
	}
	
	public abstract function add(MenuItem $menuItem);
	
	public abstract function remove(MenuItem $menuItem);
	
	public abstract function draw();
	
}
