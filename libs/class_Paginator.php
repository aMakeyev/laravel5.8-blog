<?php
//вывод переменные которые меняются в методе нет в классе - из экземпляра не вызовишь
//!!!чтобы обратитсся к св-ам, нужно все объявить в теле класса - если в методы они передаются извне - передать их в класс: $this->limit = $limit;
//!!!!$paginator->num+1 не равно ++начало или конец++ - так не работает
class Paginator {
	public $num;
	public $lastPage;
	public $startIndex;
	public $left_neighbour;
	public $right_neighbour;
	public $limit;
	public $neighbours;

	public function __construct($num, $limit, $neighbours, $lastPage) {
		$this->num = $num;
		$this->limit = $limit;
		$this->neighbours = $neighbours;
		$this->lastPage = $lastPage;
		$this->startIndex = $this->num*$this->limit - $this->limit;
		$this->left_neighbour = $this->num - $this->neighbours;
		if ($this->left_neighbour < 1)
			$this->left_neighbour = 1;
			$this->right_neighbour = $this->num + $this->neighbours;
		if ($this->right_neighbour > $this->lastPage)
			$this->right_neighbour = $this->lastPage;
	}
}
