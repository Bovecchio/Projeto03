<%-- 
    Document   : fornecedores
    Created on : 27/03/2019, 22:26:37
    Author     : finha
--%>

<%@page import="br.com.projeto03.fatecpg.poo.Bd"%>
<%@page import="br.com.projeto03.fatecpg.poo.Fornecedor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%   try {
     if(request.getParameter("add")!= null){
        Fornecedor  f = new Fornecedor();
        f.setNome(request.getParameter("nome"));
        f.setCnpj(request.getParameter("cnpj"));
        f.setEmail(request.getParameter("email"));
        f.setTelefone(request.getParameter("telefone"));
        f.setEndereço(request.getParameter("endereco"));
        f.setRazaoSocial(request.getParameter("razao"));
        Bd.getFornecedores().add(f);
        response.sendRedirect(request.getRequestURI());
   
    }else if(request.getParameter("del")!=null){
      int i = Integer.parseInt(request.getParameter("i"));
      Bd.getFornecedores().remove(i);
      response.sendRedirect(request.getRequestURI());
    }else if(request.getParameter("alt")!=null){
      int indice = Integer.parseInt(request.getParameter("indice"));
      Bd.getFornecedores().remove(indice);
      
      Fornecedor alterarFornecedor = new Fornecedor();
      alterarFornecedor.setNome(request.getParameter("nome_alt"));
      alterarFornecedor.setRazaoSocial(request.getParameter("razao_alt"));
      alterarFornecedor.setCnpj(request.getParameter("cnpj_alt"));
      alterarFornecedor.setEmail(request.getParameter("email_alt"));
      alterarFornecedor.setTelefone(request.getParameter("telefone_alt"));
      alterarFornecedor.setEndereço(request.getParameter("endereco_alt"));
      Bd.getFornecedores().add(indice, alterarFornecedor);

      response.sendRedirect(request.getRequestURI());
    }
    }catch(Exception ex) { %> 
            <script>alert("Não existe valor há ser alterado");</script>
        <% } %>  
<script>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastro de Fornecedores</title>
        
         function validacao(){
        
   var formulario = document.forms ["formcadastro"];
   var cnpj = formulario.cnpj.value;
   var endereco = formulario.endereco.value;
   var email = formulario.email.value;
   var telefone = formulario.telefone.value;
   var razao = formulario.razao.value;
   var nome = formulario.nome.value;
   var erro = false;
  
  if(cnpj == ""){
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
   if(razao == ""){
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
   var cnpj_alt = formulario_alt.cnpj_alt.value;
   var endereco_alt = formulario_alt.endereco_alt.value;
   var email_alt = formulario_alt.email_alt.value;
   var telefone_alt = formulario_alt.telefone_alt.value;
   var razao_alt = formulario_alt.razao_alt.value;
   var nome_alt = formulario_alt.nome_alt.value;
   var erro = false;
  
  if(cnpj_alt == ""){
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
   if(razao_alt == ""){
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
      
        <!-- Formulario -->  

    <!-- Grid markup Bootstrap -->
        <center><div class="card-group">
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title h5body">Cadastro de Fornecedores</h5>
                    <p class="card-text pbody">Insira os dados solicitados para criar uma lista de fornecedores.</p>
                    <form name="formcadastro" action="fornecedores.jsp" method ="post" onsubmit="return validacao()" >
                        <br>
                        <table>
                            <tr><td><input class="form-control" type="text" name="nome" placeholder="Nome da Empresa"></td></tr>
                            <tr><td><input class="form-control" type="text" name="razao" placeholder="Razão Social"></td></tr>
                            <tr><td><input class="form-control" type="text" name="cnpj" placeholder="CNPJ" id="cnpj"></td></tr>
                            <tr><td><input class="form-control" type="text" name="email" placeholder="E-mail"></td></tr>
                            <tr><td><input class="form-control" type="text" name="telefone" placeholder="Telefone" id="telefone"></td></tr>
                            <tr><td><input class="form-control" type="text" name="endereco" placeholder="Endereço"></td></tr>
                        </table>
                        <br><input class="btn btn-outline-primary" type="submit" name="add" value="Adicionar">
                        </form>
                </div>
            </div>
            <div class="card">    
                <div class="card-body">
                    <h5 class="card-title h5body">Alterar Lista</h5>
                    <p class="card-text pbody">Por favor, digitar o n° do ID e os demais dados solicitados abaixo para alterar um item da lista de Fornecedores.</p>
                    <form name="formalt" action="fornecedores.jsp" method="post" onsubmit="return validacao_alt()">
                        <table>
                            <tr><td><input class="form-control" type="text" name="id" placeholder="ID"></td></tr>
                            <tr><td><input class="form-control" type="text" name="nome_alt" placeholder="Nome da Empresa"></td></tr>
                            <tr><td><input class="form-control" type="text" name="razao_alt" placeholder="Razão Social"></td></tr>
                            <tr><td><input class="form-control" type="text" name="cnpj_alt" placeholder="CNPJ" id="cnpj_alt"></td></tr>
                            <tr><td><input class="form-control" type="text" name="email_alt" placeholder="E-mail"></td></tr>
                            <tr><td><input class="form-control" type="text" name="telefone_alt" placeholder="Telefone" id="telefone_alt"></td></tr>
                            <tr><td><input class="form-control" type="text" name="endereco_alt" placeholder="Endereço"></td></tr>
                        </table>
                        <br><input class="btn btn-outline-primary" type="submit" name="alt" value="Alterar">
                        </form>
                </div>
            </div>
        </div></center>
    
    <center><div><br>
            <h3>Lista de Fornecedores</h3>
    <br><table class="table table-striped">
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Empresa</th>
                    <th scope="col">Razão Social</th>
                    <th scope="col">CNPJ</th>
                    <th scope="col">E-mail</th>
                    <th scope="col">Telefone</th>
                    <th scope="col">Endereço</th>
                    <th scope="col">Excluir</th>
                </tr>
            </thead>

            <%for (int i = 0; i < Bd.getFornecedores().size(); i++) {%>

            <tbody>
                <tr>
                    <td><%= i %></td>
                    <td><%= Bd.getFornecedores().get(i).getNome() %></td>
                    <td><%= Bd.getFornecedores().get(i).getRazaoSocial() %></td>
                    <td><%= Bd.getFornecedores().get(i).getCnpj() %></td>
                    <td><%= Bd.getFornecedores().get(i).getEmail() %></td>
                    <td><%= Bd.getFornecedores().get(i).getTelefone() %></td>
                    <td><%= Bd.getFornecedores().get(i).getEndereço() %></td>
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
        
    </body>
</html>
