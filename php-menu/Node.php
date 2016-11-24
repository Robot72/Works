<?php

class Node extends MenuItem
{
	
	private $children = [];
	
	public function add(MenuItem $menuItem)
	{
		$this->children[$menuItem->label] = $menuItem;		
	}
	
	public function remove(MenuItem $menuItem)
	{
		unset( $this->children[$menuItem->label] );
	}
	
	public function draw()
	{
		
		$childItems = '';
		foreach($this->children as $item) {
			$childItems .= '<li>' . $item->draw() . '</li>';
		}
		
		return '<ul>' . $childItems . '</ul>';
		
	}
	
}
