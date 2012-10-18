import sys
import xml.dom.minidom


CATALOG_FILE="catalog.xml"
TEMPLATE_FILE="template.as"
FILETYPE=".as"

class asCodeGen:

	def __init__(self,pathname,prefix="AS"):
		self.pathname=pathname
		self.prefix=prefix
		try:
			self.root=xml.dom.minidom.parse(CATALOG_FILE).documentElement;
		except:
			 self.root=xml.dom.minidom.parse(CATALOG_FILE).documentElement;

		self._Object={"QName":1}
		self.template=file(TEMPLATE_FILE,"r").read()
		self.idx = 1 

	def __getbytag(self,elem,name):
		return elem.getElementsByTagName(name);	

	def generate(self):
		script= self.__getbytag(self.root,"script")
		aDefs = self.__getbytag(script[0],"def")
		aDeps = self.__getbytag(script[0],"dep")
		component = self.__getbytag(self.root,"component")

		for i in component:
			self._Object[str(i.attributes['className'].value)]=1

		for i in aDefs:	
			#<def id=">
			self._Object[str(i.attributes['id'].value)]=1

		for i in aDeps:
			self._Object[str(i.attributes['id'].value)]=1
	
		for i in script[1:]:
			_imports=[];
			aDeps = self.__getbytag(i,"dep")
			for j in aDeps:
				_id=str(j.attributes['id'].value)
				try:
					self._Object[_id]
				except:
					_imports.append(_id.replace("/","."))
				
			aDefs = self.__getbytag(i,"def")
			for j in aDefs:
				name=str(j.attributes['id'].value)
				self._create_fuzz_code(_imports,name)
				self.idx=self.idx+1
				#<dep id=">

	#	print self._Object
	
	def _create_fuzz_code(self,import_code,name):
		#first create import code
		sImports="//ascodegen\r\n\t"
		for i in import_code:
			last_i = i.replace(":",".")	
			sImports+='import '+last_i+';\r\n\t'
		sImportName = name.replace(":",".")

		sImports+="import "+sImportName+';\r\n\t'
		sName = name.split(":")[-1]
		#regex the template buf and save it for next write
		sImports+="//importend \r\n\t"
		print self.idx
		print sImports
		print sName
		tmp = self.template.replace("{{{IMPORT}}}",sImports)
#		print tmp
		tmp1 = tmp.replace("{{{MODULE}}}",sName)
#		print tmp1
		tmp2 = tmp1.replace("{{{CLASSNAME}}}",self.prefix+'_'+str(self.idx));
		f=file(self.pathname+self.prefix+'_'+str(self.idx)+FILETYPE,"w")
		f.write(tmp2)
		f.close()

	
		
	
		
				
			
def main(args):
	a = asCodeGen(args[0])
	a.generate()


if __name__ == '__main__':
	main(sys.argv[1:])
