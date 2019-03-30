<%-- 
   Document   : clientes
    Created on : 27/03/2019, 22:26:21
    Author     : finha
--%>


<%@page import="br.com.projeto03.fatecpg.poo.Bd"%>
<%@page import="br.com.projeto03.fatecpg.poo.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%  try {
    if(request.getParameter("add")!= null){
      Cliente novoCliente = new Cliente();
      novoCliente.setNome(request.getParameter("nome"));
      novoCliente.setCpf(request.getParameter("cpf"));
      novoCliente.setRg(request.getParameter("rg"));
      novoCliente.setEmail(request.getParameter("email"));
      novoCliente.setTelefone(request.getParameter("telefone"));
      novoCliente.setEndereço(request.getParameter("endereco"));
      Bd.getClientes().add(novoCliente);
      response.sendRedirect(request.getRequestURI());
    }else if(request.getParameter("del")!=null){
      int i = Integer.parseInt(request.getParameter("i"));
      Bd.getClientes().remove(i);
      response.sendRedirect(request.getRequestURI());
    }else if(request.getParameter("alt")!=null){
      int indice = Integer.parseInt(request.getParameter("indice"));
      Bd.getClientes().remove(indice);
      
      Cliente alterarCliente = new Cliente();
      alterarCliente.setNome(request.getParameter("nome_alt"));
      alterarCliente.setCpf(request.getParameter("cpf_alt"));
      alterarCliente.setRg(request.getParameter("rg_alt"));
      alterarCliente.setEmail(request.getParameter("email_alt"));
      alterarCliente.setTelefone(request.getParameter("telefone_alt"));
      alterarCliente.setEndereço(request.getParameter("endereco_alt"));
      Bd.getClientes().add(indice, alterarCliente);

      response.sendRedirect(request.getRequestURI());
    }
    }catch(Exception ex) { %> 
        <script>alert("Não existe valor há ser alterado");</script>
    <% } %>

<html>
    <head>
        <title>Cadastro de Clientes</title>
        <%@include file="WEB-INF/jspf/bootstrap_meta_and_fonts.jspf"%>
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.3.2/jquery.min.js" type="text/javascript"></script>
<script src="http://digitalbush.com/files/jquery/maskedinput/rc3/jquery.maskedinput.js" type="text/javascript"></script>
<script>
jQuery(function($){
   $("#cpf").mask("999.999.999-99");
   $("#cpf_alt").mask("999.999.999-99");
   $("#telefone_alt").mask("(99) 99999-9999"); 
   $("#telefone").mask("(99) 99999-9999");
   $("#rg").mask("99.999.999-9");
   $("#rg_alt").mask("99.999.999-9");
   
});
    function validacao(){
        
   var formulario = document.forms ["formcadastro"];
   var cpf = formulario.cpf.value;
   var endereco = formulario.endereco.value;
   var email = formulario.email.value;
   var telefone = formulario.telefone.value;
   var rg = formulario.rg.value;
   var nome = formulario.nome.value;
   var erro = false;
  
  if(cpf == ""){
       erro = true;
   }
  if(endereco == ""){
       erro = true;
   }
   if(email == ""){
       erro = true;
   }
   if(nome == ""){
       erro = true;
   }
   if(telefone == ""){
       erro = true;
   }
   if(rg == ""){
       erro = true;
   }
   
   if (erro ){
        alert ("Preencha todos os campos corretamente");
        return false;
        }else {
            return true;
        }
    }
function validacao_alt(){
        
   var formulario_alt = document.forms ["formalt"];
   var cpf_alt = formulario_alt.cpf_alt.value;
   var endereco_alt = formulario_alt.endereco_alt.value;
   var email_alt = formulario_alt.email_alt.value;
   var telefone_alt = formulario_alt.telefone_alt.value;
   var rg_alt = formulario_alt.rg_alt.value;
   var nome_alt = formulario_alt.nome_alt.value;
   var erro = false;
  
  if(cpf_alt == ""){
       erro = true;
   }
  if(endereco_alt == ""){
       erro = true;
   }
   if(email_alt == ""){
       erro = true;
   }
   if(nome_alt == ""){
       erro = true;
   }
   if(telefone_alt == ""){
       erro = true;
   }
   if(rg_alt == ""){
       erro = true;
   }
   
   if (erro ){
        alert ("Preencha todos os campos corretamente");
        return false;
        }else {
            return true;
        }
    }
</script>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/navbar.jspf"%>
        
<!-- Formulario -->  

    <!-- Grid markup Bootstrap -->
        <center><div class="card-group">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title h5body">Cadastro de Clientes</h5>
                    <p class="card-text pbody">Insira os dados solicitados para criar uma lista de clientes.</p>
                    <br>
                    <form name="formcadastro" action="clientes.jsp" method ="post" onsubmit="return validacao()" >
                        <table>
                            <tr><td><input class="form-control" type="text" name="nome" placeholder="Nome"></td></tr>
                            <tr><td><input class="form-control" type="text" name="cpf" placeholder="CPF"id="cpf"></td></tr>
                            <tr><td><input class="form-control" type="text" name="rg" placeholder="RG"id="rg"></td></tr>
                            <tr><td><input class="form-control" type="text" name="email" placeholder="E-mail"></td></tr>
                            <tr><td><input class="form-control" type="text" name="telefone" placeholder="Telefone"id="telefone"></td></tr>
                            <tr><td><input class="form-control" type="text" name="endereco" placeholder="Endereço"></td></tr>
                        </table>
                        <br><input class="btn btn-outline-primary" type="submit" name="add" value="Adicionar">
                        </form>
                </div>
            </div>    
            <div class="card">    
                <div class="card-body">
                    <h5 class="card-title h5body">Alterar Lista</h5>
                    <p class="card-text pbody">Digite o ID do campo que deseja alterar e insira novamente os dados para gerar a alteração.</p>
                    <form name="formalt" action="clientes.jsp" method="post" onsubmit="return validacao_alt()">
                        <table>
                            <tr><td><input class="form-control" type="text" name="indice" placeholder="Índice"></td></tr>
                            <tr><td><input class="form-control" type="text" name="nome_alt" placeholder="Nome"></td></tr>
                            <tr><td><input class="form-control" type="text" name="cpf_alt" placeholder="CPF"id="cpf_alt"></td></tr>
                            <tr><td><input class="form-control" type="text" name="rg_alt" placeholder="RG"id="rg_alt"></td></tr>
                            <tr><td><input class="form-control" type="text" name="email_alt" placeholder="E-mail"></td></tr>
                            <tr><td><input class="form-control" type="text" name="telefone_alt" placeholder="Telefone"id="telefone_alt"></td></tr>
                            <tr><td><input class="form-control" type="text" name="endereco_alt" placeholder="Endereço"></td></tr>
                        </table>
                        <br><input class="bttbody btn btn-primary" type="submit" name="alt" value="Alterar">
                        </form>
                </div>
            </div>
        </div></center>
    
    <center><div>
        <table class="table">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Nome</th>
                    <th scope="col">CPF</th>
                    <th scope="col">RG</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Endereço</th>
                    <th scope="col">Excluir</th>
                </tr>
            </thead>

            <%for (int i = 0; i < Bd.getClientes().size(); i++) {%>

            <tbody>
                <tr>
                    <td><%= i %></td>
                    <td><%= Bd.getClientes().get(i).getNome() %></td>
                    <td><%= Bd.getClientes().get(i).getCpf() %></td>
                    <td><%= Bd.getClientes().get(i).getRg() %></td>
                    <td><%= Bd.getClientes().get(i).getEmail() %></td>
                    <td><%= Bd.getClientes().get(i).getTelefone() %></td>
                    <td><%= Bd.getClientes().get(i).getEndereço() %></td>
                    <td>
                        <form>
                            <input type="hidden" name="i" value="<%= i %>"/>
                            <input type="submit" name="del" value="Excluir"/>
                        </form>
                    </td>
                </tr>
            <% } %>    
            </tbody>
        </table>
    </div></center>
    
        <%@include file="WEB-INF/jspf/footer.jspf"%>
        
        <%@include file="WEB-INF/jspf/bootstrap_body_end.jspf"%>
    </body>
</html>
