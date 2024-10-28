//------------------------------------------------------------------------------------------------------------
//********* Sobre ************
//Autor: Gisele de Melo
//Esse c�digo foi desenvolvido com o intuito de aprendizado para o blog codedelphi.com, portanto n�o me
//responsabilizo pelo uso do mesmo.
//
//********* About ************
//Author: Gisele de Melo
//This code was developed for learning purposes for the codedelphi.com blog, therefore I am not responsible for
//its use.
//------------------------------------------------------------------------------------------------------------

unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type

  //Interface
  IExemplo = interface
    procedure MostrarMensagem;
  end;

  //Classe gen�rica que implementa a interface IExemplo e obriga que o tipo gen�rico seja uma classe
  TClasseGenerica<T: class, IExemplo> = class
  private
    FObjeto: T;
  public
    constructor Create(AObjeto: T);
    procedure Executar;
  end;

  //Classe que implementa a interface IExemplo que obriga a ter o m�todo MostrarMensagem
  TExemploConcreto = class(TInterfacedObject, IExemplo)
    public
      procedure MostrarMensagem;
    end;

  //Formul�rio principal
  TForm1 = class(TForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    procedure TestarGenerics;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TClasseGenerica<T> }

constructor TClasseGenerica<T>.Create(AObjeto: T);
begin
  FObjeto := AObjeto;
end;

procedure TClasseGenerica<T>.Executar;
begin
  FObjeto.MostrarMensagem;
end;

{ TExemploConcreto }

procedure TExemploConcreto.MostrarMensagem;
begin
  ShowMessage('Mensagem exibida da classe TExemploConcreto.');
end;

{ TForm1 }

procedure TForm1.TestarGenerics;
var
  ObjConcreto: TExemploConcreto;
  Generica: TClasseGenerica<TExemploConcreto>;

begin
  // Criar uma inst�ncia de TExemploConcreto
  ObjConcreto := TExemploConcreto.Create;
  Try
    // Instanciar TClasseGenerica com o tipo TExemploConcreto
    Generica := TClasseGenerica<TExemploConcreto>.Create(ObjConcreto);

    // Chamar o m�todo Executar para exibir a mensagem
    Generica.Executar;
  Finally
    // Liberar mem�ria
    Generica.Free;
  End;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  //Chama o m�todo
  TestarGenerics;
end;

end.


