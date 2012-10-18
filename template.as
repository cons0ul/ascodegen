package {
	import flash.display.Sprite;
	{{{IMPORT}}}
	import flash.utils.describeType;

	import flash.external.ExternalInterface;
	import flash.text.Font;
	import flash.utils.describeType;
	import flash.utils.*;
	import com.seld.util.*;
	import mx.graphics.codec.*;
	import flash.display.*;
	
	public class {{{CLASSNAME}}} extends Sprite {
		public static var enabled:Boolean = true;
		public static var _isExternalInterfaceAvailable:Boolean;
		public static var isInit:Boolean;
		public var aRef:Array = new Array();
		public var aEvil:Array = new Array();
		public var aEvil_str:Array = new Array();
		public var rootXML:XML;
		public var aSubObjects:Array = new Array();
		public var gen:SeededRand;
		public var blacklist:Object = {};


		public function haunting():void{

			aEvil.push("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
			aEvil.push("http:///////////////////////////////////////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA");
			aEvil.push("\u01111");

			for(var i:int = 0;i<1000;i+=4){
				aEvil.push(i);
				aEvil.push(i*-1);
			}
			aEvil.push(0x100)
			aEvil.push(0x200)
			aEvil.push(0x300)
			aEvil.push(0x400)
			aEvil.push(0x600)
			aEvil.push(0x800)

			aEvil.push(-0x100)
			aEvil.push(-0x200)
			aEvil.push(-0x300)
			aEvil.push(-0x400)
			aEvil.push(-0x600)
			aEvil.push(-0x800)

			aEvil.push(0x7ffffffe)
			aEvil.push(0x80000000)
			aEvil.push(0xffffffff)
			aEvil.push(0.1)
			aEvil.push(65535)
			aEvil.push(65536)
			aEvil.push(4096)
			aEvil.push(32767)
			aEvil.push(32768)
			aEvil.push(-65535)

			aEvil.push(this)
			//aEvil.push(null)
			aEvil.push(true)
			aEvil.push(false)
			aEvil.push(new Object());
			aEvil.push(new Array());
			aEvil.push(new String());
			aEvil.push((function(o:*){trace();new Object();log('from anon '+o)}))
			aEvil.push("AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA")
			aEvil.push(2147483647) 
			aEvil.push(2147483648) 
			aEvil.push(2147483649)
            aEvil.push(4294967295)
            aEvil.push(4294967296)
            aEvil.push(4294967297)
            aEvil.push(9223372036854775807)
            aEvil.push(9223372036854775808)
            aEvil.push(9223372036854775809)
            aEvil.push(18446744073709551615) 
            aEvil.push(18446744073709551616)
            aEvil.push(18446744073709551617)
            aEvil.push(0x200000000)
            aEvil.push(-0x200000000)
            aEvil.push(0x22000000000000000)
            aEvil.push(-0x22000000000000000)

            aEvil.push(-2147483647) 
			aEvil.push(-2147483648) 
			aEvil.push(-2147483649)
            aEvil.push(-4294967295)
            aEvil.push(-4294967296)
            aEvil.push(-4294967297)
            aEvil.push(-9223372036854775807)
            aEvil.push(-9223372036854775808)
            aEvil.push(-9223372036854775809)
            aEvil.push(-18446744073709551615) 
            aEvil.push(-18446744073709551616)
            aEvil.push(-18446744073709551617)


      aEvil.push(-0.0)  
      aEvil.push(3.1415926535897932384626433832795)
      aEvil.push(1.0)
      aEvil.push(0.1)
      aEvil.push(2.2250738585072016e-308) 
      aEvil.push(2.2250738585072015e-308) 
      aEvil.push(2.2250738585072014e-308) 
      aEvil.push(2.2250738585072013e-308) 
      aEvil.push(2.2250738585072012e-308) 
      aEvil.push(1.7976931348623159e+308) 
      aEvil.push(1.7976931348623158e+308) 
      aEvil.push(1.7976931348623157e+308) 
      aEvil.push(1.7976931348623156e+308) 
      aEvil.push(1.7976931348623155e+308) 
      aEvil.push(4.9406564584124655e-324)
      aEvil.push(4.9406564584124654e-324)  
aEvil.push(+1.5e1932788);
aEvil.push(-36751.7e+5);
}

		public static function get isExternalInterfaceAvailable():Boolean{
			if(!isInit){
				_isExternalInterfaceAvailable = ExternalInterface.available;
				isInit = true;
			}
			return _isExternalInterfaceAvailable;
		}

		public static function log(...rest):void{
			send("dump",rest);
		}

		private static function send(level:String,...rest):void{
			if(enabled){
				if( isExternalInterfaceAvailable) {
					ExternalInterface.call("dump",rest[0]+"\n");
				}
				trace(rest);
			}
		}

		public function HelloWorld() {
			log("[*] Start");
			gen = new SeededRand((new Date().getTime() & 0xFFFFFFF));
			construct();
			rootXML = describeType(aRef[0]);
			awaking();
			log("[*] EXITING");
		}

		public function awaking():void{
			haunting();
			gen.setRange(0,aEvil.length);
			var accessors:XMLList = rootXML.accessor;
			log("[*] fuzzing members");
			fuzz_accessors(accessors);			
			var methods:XMLList = rootXML.method
			log("[%] fizzing methods")
			setTimeout(function () { fuzz_methods(methods) } ,10)
		}

		public function fuzz_methods(root:XMLList):void{
				setTimeout( function (x:XML) { return function() {
					var item:XML;
					var i:int;
					for each(item in root){ 
						var s_name:String = x.@name.toString()
						for(var k:int = 0 ; k<4096;k++){
							var args:Array = new Array()	
							for each(var param_item:XML in x.parameter)
							{
								args.push(aEvil[gen.ranged])
							}			
							log(aRef[0]+"."+s_name+"(" + args + ")")		
							try{ var ret:* = aRef[0][s_name].apply(null,args) }catch(e:Error){}
							log("ret="+ret);
						}			
					}
					_exit();
				}}(item),10)				
			}
		}

		public function fuzz_accessors(root:XMLList):void{
			var item:XML;
			var i:int;

			for each(item in root){
					var s_type:String = item.@type.toString()
					var s_name:String = item.@name.toString();

					switch(s_type){
					case "Boolean":
					case "int":
					case "Number":
						setTimeout( function ():void { 							
							for(i=0;i<aEvil.length;i++)
							{
								log(aRef[0]+"."+s_name+"="+aEvil[i].toString())
								try { aRef[0][s_name]=aEvil[i] }catch(e:Error){}
							}
							},10)
							break;
					case "String":
						setTimeout( function ():void {
							for(i=0;i<aEvil_str.length;i++){
								log(aRef[0]+"."+s_name+"="+aEvil_str[i].toString())
								try { aRef[0][s_name]=aEvil_str[i]}catch(e:Error){}
							}
							},10)
							break;
					case "Array":
						setTimeout( function ():void { 
							for(i=0;i<aEvil_str.length;i++){
								log(aRef[0]+"."+s_name+"["+i.toString()+"]="+aEvil[i].toString())
								try { aRef[0][s_name][i] = aEvil[i]}catch(e:Error){}
							}
							},10)
							break;
					default:
							log("aSubObjects.push("+aRef[0]+"."+s_name+")")
							try { aSubObjects.push(new aRef[0][s_name]())}catch(e:Error){}	
							break;		
					}
				//}
			}
		}


		public function construct():void{
				trace("[*] Constructing classes and saving refrences")			
				try { aRef.push(new {{{MODULE}}}()); }catch(e:Error){
					try { aRef.push({{{MODULE}}}); }catch(e:Error){
						try { aRef.push({{{MODULE}}}(0);)}catch(e:Error){_exit();
				}}}
		}	

		public function _exit():void{
				send("window.location.reload")
		}
	}
}	
