/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package br.com.projeto03.fatecpg.poo;

import java.util.ArrayList;

/**
 *
 * @author finha
 */
public class Bd {
    private static ArrayList<Cliente> clientes = new ArrayList<>();
    private static ArrayList<Fornecedor> fornecedores = new ArrayList<>();

    public static ArrayList<Cliente> getClientes() {
        return clientes;
    }

    public static ArrayList<Fornecedor> getFornecedores() {
        return fornecedores;
    }
    
}