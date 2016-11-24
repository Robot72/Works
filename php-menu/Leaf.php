<?php

class Leaf extends MenuItem
{
	
	public function add(MenuItem $menuItem)
	{
		;
	}
	
	public function remove(MenuItem $menuItem)
	{
		;	
	}
	
	public function draw()
	{
		return '<a href="#">' . $this->label . '</a>';	
	}
	
}
