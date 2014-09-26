<?php
session_start();
/* Import Classes */
include_once("user.php");
/* General Shopping Cart
Author: Ewere Diagboya
Company: Wicee Solutions
Date/Time: 2014-09-08 9:52PM
Location: My Brother's Room

Description: Shopping Cart Functionalities
*/
class Cart extends useroperations {

	function AddtoCart($itemname, $qty, $price)
	{
		if(!isset($_SESSION['cartid']) && $_SESSION['cartid'] == '')
		{
			$_SESSION['cartid'] = date('YmdHisu');
		}
		$total = $qty * $price;
		$tablename = "cart";
		$fields = array('cartid','itemname','qty', 'unitprice','total');
		$values = array($_SESSION['cartid'], $qty, $price, $total);
		$response = $this->InsertOpt($tablename, $fields, $values);
		return $response; 
	}
	
	function DeleteFromCart($cartid, $id)
	{
		// Delete Item from Cart
		$response = $this->Delete("WHERE `cartid` = '$cartid' AND `id`='$id'", "cart");
		return $response;
	}

	function UpdateQty($cartid, $id, $qty, $price)
	{
		// Update Stock Qty
		$tablename = "cart";
		$newtotal = $qty * $price;
		$response = $this->UpdateDB("SET `qty`='$qty' AND `total`='$newtotal' WHERE `cartid`='$cartid' AND `qty`='$qty'", $tablename);
		return $response;
	}

	function Checkout($cartid) 
	{
		// Perform Checkout
		$tablename = "cart";
		$response = $this->UpdateDB("SET `checkout`='1' WHERE `cartid`='$cartid'", $tablename);
		return $response;
	}
	
	function JoinusertoCart($cartid, $userid)
	{
		// Add User to Cart
		$tablename = "cart";
		$newtotal = $qty * $price;
		$_SESSION['cartid'] = NULL;
		$response = $this->UpdateDB("SET `userid`='$userid' WHERE `cartid`='$cartid'", $tablename);
		return $response;
	}
	
	function CartData($cartid)
	{
		$getcartdata = "SELECT * FROM cart";
	}

}
?>
