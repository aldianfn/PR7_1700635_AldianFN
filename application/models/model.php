<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Model extends CI_Model {

	/**
	 * Index Page for this controller.
	 *
	 * Maps to the following URL
	 * 		http://example.com/index.php/welcome
	 *	- or -
	 * 		http://example.com/index.php/welcome/index
	 *	- or -
	 * Since this controller is set as the default controller in
	 * config/routes.php, it's displayed at http://example.com/
	 *
	 * So any other public methods not prefixed with an underscore will
	 * map to /index.php/welcome/<method_name>
	 * @see https://codeigniter.com/user_guide/general/urls.html
	 */
	public function index()
	{
		$this->load->view('welcome_message');
	}

  public function getKursi() {
    $this->db->select('lokomotif.kd_kereta,nama, kursi.kd_kursi');
    $this->db->from('lokomotif');
    $this->db->join('kursi', 'kursi.kd_kereta = lokomotif.kd_kereta', 'left');
    $query = $this->db->get();
    if ($query->num_rows() >0){
        foreach ($query->result() as $data) {
            $hasilKursi[] = $data;
        }
    return $hasilKursi;
    }
  }

  public function getGerbong() {
    $this->db->select('kursi.kd_kursi,kursi.kd_kereta, gerbong.kd_gerbong,nama_gerbong');
    $this->db->from('kursi');
    $this->db->join('gerbong', 'gerbong.kd_gerbong = kursi.kd_gerbong', 'right');
    $query = $this->db->get();
    if ($query->num_rows() >0){
        foreach ($query->result() as $data) {
            $hasilGerbong[] = $data;
        }
    return $hasilGerbong;
    }
  }


  public function getLokomotif() {
    $this->db->select('lokomotif.kd_kereta,lokomotif.nama,kursi.kd_kursi,gerbong.kd_gerbong,gerbong.nama_gerbong');
    $this->db->from('lokomotif');
    $this->db->join('kursi', 'kursi.kd_kereta = lokomotif.kd_kereta', 'inner');
    $this->db->join('gerbong', 'gerbong.kd_kereta = lokomotif.kd_kereta', 'inner');
    $query = $this->db->get();
    return $query->result();
  }
}
