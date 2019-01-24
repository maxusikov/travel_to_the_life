<?php
class ModelCustomerCurator extends Model {
    public function addCurator($curator_data){
        $sql = "INSERT INTO `" . DB_PREFIX . "contestant_curator` (name, email, password) VALUES('" . (string)$curator_data['name'] . "', '" . (string)$curator_data['email'] . "', '" . (string)md5($curator_data['password']) . "')";

        $this->db->query($sql);

        return $this->db->getLastId();
    }

    public function updateCuratorById($curator_data){
        $sql  = "UPDATE `" . DB_PREFIX . "contestant_curator` SET ";
        $sql .= "name='" . (string)$curator_data['name'] . "', ";
        $sql .= "email='" . (string)$curator_data['email'] . "', ";
        $sql .= "password='" . (string)md5($curator_data['password']) . "' ";
        $sql .= "WHERE curator_id='" . (int)$curator_data['curator_id'] . "'";

        $result = $this->db->query($sql);

        return $result;
    }

    public function deleteCuratorById($curator_id){
        $sql = "DELETE FROM `" . DB_PREFIX . "contestant_curator` WHERE curator_id='" . (int)$curator_id . "'";

        $result = $this->db->query($sql);

        return $result;
    }

    public function getCuratorById($curator_id){
        $sql = "SELECT * FROM `" . DB_PREFIX . "contestant_curator` WHERE curator_id='" . (int)$curator_id . "'";

        $result = $this->db->query($sql);

        return $result->row;
    }

    public function getCuratorList(){
        $sql = "SELECT * FROM `" . DB_PREFIX . "contestant_curator`";

        $result = $this->db->query($sql);

        return $result->rows;
    }
}
