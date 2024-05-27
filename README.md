# Ponderada-sem-3
<div align="center">
<img src="Assets/image (9).png">
</div>
A imagem mostra um diagrama de banco de dados com várias tabelas e as relações entre elas. Vou explicar as tabelas principais, as tabelas secundárias e o tipo de relação entre elas.

### Tabelas Principais:

1. **Perfil_usuario**:
   - **Colunas**: idUsuario, nome, data_nascimento, genero, email, senha, cidade, estado, horasTotais
   - **Relações**:
     - Um usuário pode ter várias participações em voluntariados (1:N com Voluntariado)
     - Um usuário pode estar relacionado a várias empresas e vice-versa (N:N com Perfil_empresa através de Usuarios_Empresa)
     - Um usuário pode participar de vários projetos e vice-versa (N:N com Projeto através de Usuarios_Projeto)

2. **Perfil_empresa**:
   - **Colunas**: idPerfil_empresa, nome, cnpj, cidade, estado, dataCriacao, telefone, atuacao, representante
   - **Relações**:
     - Uma empresa pode criar vários projetos (1:N com Projeto)
     - Uma empresa pode estar relacionada a vários usuários e vice-versa (N:N com Perfil_usuario através de Usuarios_Empresa)
     - Uma empresa pode estar envolvida em vários projetos e vice-versa (N:N com Projeto através de Empresa_Projeto)

3. **Projeto**:
   - **Colunas**: idProjeto, nome, descricao, cidade, estado, numeroVagas, dataCriacao
   - **Relações**:
     - Um projeto pode ter várias empresas envolvidas (1:N com Empresa_Projeto)
     - Um projeto pode ter vários usuários participando e vice-versa (N:N com Perfil_usuario através de Usuarios_Projeto)
     - Um projeto pode envolver várias empresas e vice-versa (N:N com Perfil_empresa através de Empresa_Projeto)

4. **Voluntariado**:
   - **Colunas**: idVoluntariado, idUsuario, titulo, descricao, horasTrabalhadas, status, dataInicio, dataFim, numeroVoluntarios
   - **Relações**:
     - Vários voluntariados podem estar associados a um único usuário (N:1 com Perfil_usuario)

### Tabelas Secundárias:

1. **Usuarios_Empresa**:
   - **Colunas**: idPerfil_empresa, idUsuario, cargo, horasContadas, dataEntrada
   - **Relações**:
     - Conecta usuários e empresas (N:N entre Perfil_usuario e Perfil_empresa)

2. **Empresa_Projeto**:
   - **Colunas**: idPerfil_empresa, idProjeto, area, horasContadas, dataCriacao
   - **Relações**:
     - Conecta empresas e projetos (N:N entre Perfil_empresa e Projeto)

3. **Usuarios_Projeto**:
   - **Colunas**: idUsuario, idProjeto, funcao, horasContadas, dataEntrada
   - **Relações**:
     - Conecta usuários e projetos (N:N entre Perfil_usuario e Projeto)

### Tipos de Relação:

- **1:1**: sem relações 1:1 
- **1:N**: 
  - Um usuário pode ter várias participações em voluntariados (Perfil_usuario e Voluntariado)
  - Uma empresa pode criar vários projetos (Perfil_empresa e Projeto)
- **N:N**:
  - Usuários e empresas podem se relacionar de várias formas através da tabela Usuarios_Empresa
  - Usuários e projetos se conectam através da tabela Usuarios_Projeto
  - Empresas e projetos se conectam através da tabela Empresa_Projeto

Essas relações mostram como os perfis de usuários e empresas, assim como os projetos, estão interligados, facilitando a gestão de voluntariados e a participação em iniciativas sociais.
