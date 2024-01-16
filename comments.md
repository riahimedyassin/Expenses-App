# Components and properties 
SingleViewChildScroll : Scrollable element ; 
Container 
SizedBox 
Expanded : Take the all of the available elemnts on screen 
Padding : Component to add only padding 
Dissimisible : Component that enables the slide of an elements , An action could be excuted on that 
which is most of the time deleting the element 
Note that deleting the component from the screen requires deleting it from the source list 
showDialog : let's you display a dialog , such as Alert , which is by itself a component that could be used to alert users ; 
TextField : To controll the data entered in a text field , you can use TextFieldController() ; 
Note that you have to dispose those controllers on dispose of the scaffold , so they won't be capturing data otr waiting for it 
Destroy them for better performance 

Themes : You can specify your themes in the main so you can refer to the colors and different theme rules you setted up earlier in it .


Lock Orientation : 
SystemChrome.setPreferedOrientations([
    DeviceOrientation.landscapeUp || landscapeDown || portraitUp || portraitDown
])
this fuctino returns a futur , so we need to run our app after the orientation is done

Whenever you want to use a fucntion that returns a futur in the main function , you have to use : 
WidgetsFlutterBinding.ensureInitialization() ; 

Layoubuilder() 

Adaptevness : 
For ios , there are some special design libraries called Cupertino , installed by defualt with the dart project .
There are some componentns such as Dialogs , Alert buttons etc that could be used instead of the material default widgets .
To make sure of the paltform the app is running on before excuting the code , you can use the class Platform that provides you with boolean values about you current platform .


There are some widgets that are adaptive by default , you just have to write WidgetName.adaptive and excute the code of it .
