Subject: ERROR: Kernel configuration is invalid
To: meta-virtualization@lists.yoctoproject.org
From: "Ashish" <ashishm@mvista.com>
X-Originating-Location: Thane, Maharashtra, IN (139.5.45.160)
X-Originating-Platform: Linux Chrome 83
User-Agent: GROUPS.IO Web Poster
MIME-Version: 1.0
Date: Mon, 03 Aug 2020 06:46:50 -0700
Message-ID: <nRJC.1596462410038971461.CDAD@lists.yoctoproject.org>
X-Groupsio-MsgNum: 5671
Content-Type: multipart/mixed; boundary="4ybuOlhk0G42JBdm5nAO"

--4ybuOlhk0G42JBdm5nAO
Content-Type: multipart/alternative; boundary="es3XZUZhndkYt4oK4fQM"

--es3XZUZhndkYt4oK4fQM
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All ,

I am trying to build an out-of-tree hello-world module=C2=A0 using the XEN=
 + RPI4 setup.

1)=C2=A0 Compilation of kernel-modules with this setup shows below error:
*/home/ashish/yocto-default/build-xenimage/tmp/work-shared/raspberrypi4-64=
/kernel-source/Makefile:609: include/config/auto.conf: No such file or dire=
ctory*

*ERROR: Kernel configuration is invalid.*
*include/generated/autoconf.h or include/config/auto.conf are missing.*
*Run 'make oldconfig && make prepare' on kernel src to fix it.*

2) Please find that just to ensure if the procedure to compile an external=
 modules is correct ,
i tried setting *MACHINE ?=3D "qemuarm64" ,* and reported same steps .
I was able to compile the kernel module properly & ran on qemu to confirm =
the module is proper.

3) Steps followed :
1) Create an basic hello-world-module.c & Makefile in any known location (=
 say custom layer )

2) $ bitbake -c devshell virtual/kernel
$ make M=3D<Location of module created in step 1 above>=C2=A0 modules

I was under expectation that the config file would be proper as we are abl=
e to generate xen-image-minimal.

Any pointers or suggestion will be helpful.

--es3XZUZhndkYt4oK4fQM
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi All ,&nbsp;<br /><br />I am trying to build an out-of-tree hello-world m=
odule&nbsp; using the XEN + RPI4 setup.&nbsp;<br /><br />1)&nbsp; Compilati=
on of kernel-modules with this setup shows below error:<br />
<div><strong>/home/ashish/yocto-default/build-xenimage/tmp/work-shared/ras=
pberrypi4-64/kernel-source/Makefile:609: include/config/auto.conf: No such =
file or directory</strong></div>
<div>&nbsp;</div>
<div><strong>&nbsp; ERROR: Kernel configuration is invalid.</strong></div>
<div><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;include/generated/autoconf.=
h or include/config/auto.conf are missing.</strong></div>
<div><strong>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;Run 'make oldconfig &amp;&a=
mp; make prepare' on kernel src to fix it.</strong><br /><br />2) Please fi=
nd that just to ensure if the procedure to compile an external modules is c=
orrect ,&nbsp;<br />&nbsp; &nbsp; &nbsp;i tried setting&nbsp;<strong>MACHIN=
E ?=3D "qemuarm64" ,&nbsp;</strong> and reported same steps .&nbsp;<br />&n=
bsp; &nbsp; &nbsp;I was able to compile the kernel module properly &amp; ra=
n on qemu to confirm the module is proper.&nbsp;<br /><br /><br />3) Steps =
followed :<br />&nbsp; &nbsp; &nbsp; &nbsp; 1) Create an basic hello-world-=
module.c &amp; Makefile in any known location ( say custom layer )<br />&nb=
sp; &nbsp; &nbsp; &nbsp;&nbsp;<br />&nbsp; &nbsp; &nbsp; &nbsp; 2) $ bitbak=
e -c devshell virtual/kernel<br />&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 $ make M=3D&lt;Location of module created in step 1 above&gt;&nbsp; module=
s</div>
<div><br />I was under expectation that the config file would be proper as=
 we are able to generate xen-image-minimal.<br /><br />Any pointers or sugg=
estion will be helpful.&nbsp;<br /><br /><br /><br /><br /><br /><br /><br =
/><br /><br /><br /></div>

--es3XZUZhndkYt4oK4fQM--

--4ybuOlhk0G42JBdm5nAO
Content-Type: text/plain; name="error-log.txt"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="error-log.txt"

WzEzOjI5OjMzXTp+L3lvY3RvLWRlZmF1bHQvYnVpbGQteGVuaW1hZ2UvdG1wL3dvcmstc2hhcmVk
L3Jhc3BiZXJyeXBpNC02NC9rZXJuZWwtc291cmNlIChycGktNS40LnkpIDogbWFrZSBNPS9ob21l
L2FzaGlzaC95b2N0by1kZWZhdWx0L2xheWVyL21ldGEta3JubC9yZWNpcGVzLWtybmwvbXlfbW9k
dWxlLyBtb2R1bGVzCm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSAnL2hvbWUvYXNoaXNoL3lv
Y3RvLWRlZmF1bHQvYnVpbGQteGVuaW1hZ2UvdG1wL3dvcmsvcmFzcGJlcnJ5cGk0XzY0LXBva3kt
bGludXgvbGludXgtcmFzcGJlcnJ5cGkvMV81LjQuNTErZ2l0QVVUT0lOQythYWZiOGYwOTVlX21h
Y2hpbmUtcjAvbGludXgtcmFzcGJlcnJ5cGk0XzY0LXN0YW5kYXJkLWJ1aWxkJwovaG9tZS9hc2hp
c2gveW9jdG8tZGVmYXVsdC9idWlsZC14ZW5pbWFnZS90bXAvd29yay1zaGFyZWQvcmFzcGJlcnJ5
cGk0LTY0L2tlcm5lbC1zb3VyY2UvTWFrZWZpbGU6NjA5OiBpbmNsdWRlL2NvbmZpZy9hdXRvLmNv
bmY6IE5vIHN1Y2ggZmlsZSBvciBkaXJlY3RvcnkKCiAgRVJST1I6IEtlcm5lbCBjb25maWd1cmF0
aW9uIGlzIGludmFsaWQuCiAgICAgICAgIGluY2x1ZGUvZ2VuZXJhdGVkL2F1dG9jb25mLmggb3Ig
aW5jbHVkZS9jb25maWcvYXV0by5jb25mIGFyZSBtaXNzaW5nLgogICAgICAgICBSdW4gJ21ha2Ug
b2xkY29uZmlnICYmIG1ha2UgcHJlcGFyZScgb24ga2VybmVsIHNyYyB0byBmaXggaXQuCgovaG9t
ZS9hc2hpc2gveW9jdG8tZGVmYXVsdC9idWlsZC14ZW5pbWFnZS90bXAvd29yay1zaGFyZWQvcmFz
cGJlcnJ5cGk0LTY0L2tlcm5lbC1zb3VyY2UvTWFrZWZpbGU6NjgxOiByZWNpcGUgZm9yIHRhcmdl
dCAnaW5jbHVkZS9jb25maWcvYXV0by5jb25mJyBmYWlsZWQKbWFrZVsxXTogKioqIFtpbmNsdWRl
L2NvbmZpZy9hdXRvLmNvbmZdIEVycm9yIDEKbWFrZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgJy9o
b21lL2FzaGlzaC95b2N0by1kZWZhdWx0L2J1aWxkLXhlbmltYWdlL3RtcC93b3JrL3Jhc3BiZXJy
eXBpNF82NC1wb2t5LWxpbnV4L2xpbnV4LXJhc3BiZXJyeXBpLzFfNS40LjUxK2dpdEFVVE9JTkMr
YWFmYjhmMDk1ZV9tYWNoaW5lLXIwL2xpbnV4LXJhc3BiZXJyeXBpNF82NC1zdGFuZGFyZC1idWls
ZCcKTWFrZWZpbGU6MTc5OiByZWNpcGUgZm9yIHRhcmdldCAnc3ViLW1ha2UnIGZhaWxlZAptYWtl
OiAqKiogW3N1Yi1tYWtlXSBFcnJvciAyClsxMzoyOTo0M106fi95b2N0by1kZWZhdWx0L2J1aWxk
LXhlbmltYWdlL3RtcC93b3JrLXNoYXJlZC9yYXNwYmVycnlwaTQtNjQva2VybmVsLXNvdXJjZSAo
cnBpLTUuNC55KSA6IAoKCgoKCgo=

--4ybuOlhk0G42JBdm5nAO--
