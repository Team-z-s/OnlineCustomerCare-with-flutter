package api

import (
	"encoding/json"
	"github.com/julienschmidt/httprouter"
	"net/http"
	"onlineCustomerCare/service_and_company"
	"strconv"
)

type sacapi struct {
	sacServ service_and_company.SacService
}
func NewSacApi (sacv service_and_company.SacService)*sacapi{
	return &sacapi{sacServ:sacv}
}
func(sa *sacapi) SearchByService(w http.ResponseWriter, r *http.Request,ps httprouter.Params){
	w.Header().Set("Content-Type","application/json")

	id,_ := strconv.Atoi(ps.ByName("id"))
	s,_ := sa.sacServ.SearchByService(uint(id))
	_ = json.NewEncoder(w).Encode(s)
}
func(sa *sacapi) SearchByCompany(w http.ResponseWriter, r *http.Request,ps httprouter.Params){
	w.Header().Set("Content-Type","application/json")

	id,_ := strconv.Atoi(ps.ByName("id"))
	s,_ := sa.sacServ.SearchByCompany(uint(id))
	_ = json.NewEncoder(w).Encode(s)
}