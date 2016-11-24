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
		$childItems = [];
		foreach($this->children as $item) {
			$childItems[] = implode('', [
				'<li>',
					$item->draw(),
				'</li>',
			]);
		}
		
		return implode('', [
			'<ul>',
				$childItems,
			'</ul>',
		]);
	}
	
}
