Return-Path: <cardoe@cardoe.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 471D1E0050B; Mon,  6 Mar 2017 16:25:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id DEDD0E0033D
	for <meta-virtualization@yoctoproject.org>;
	Mon,  6 Mar 2017 16:25:13 -0800 (PST)
Received: by mail-yw0-f194.google.com with SMTP id o4so3319432ywd.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 06 Mar 2017 16:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cardoe.com; s=google;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to; bh=10Vg14BZzz2+BT3cOLaafgXzXtVp2U3yg24Vd/Op2So=;
	b=fBEQcFolMmgpEzdk5S4vchLgl0qnSOMsxm+bRQwU4OsnJ49e+jLSI1UVEYqiz/NhqE
	I0qRoM50fx/I2OXa15WsxDqRXJIgiRy4Qfd+6/jwv9LMtsNi4Xp+H2U0D5BB8HMD/mbO
	MQnMYjkie9isoVdoWhbOK3T3CABspRmFn103g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to;
	bh=10Vg14BZzz2+BT3cOLaafgXzXtVp2U3yg24Vd/Op2So=;
	b=VPd2Sth4YoWAJEUfwkEIqExa1PKWzXPTVBCW3IVDutN9xnXdJgbPjEPS/tOo3w0pis
	9VDpOKWrhafNpzPHglV40dzevb8LFW1NGdnAL/I5FmO54RcxES50PVS+SMqiVByiard9
	6u1CPhTN/ArtPdYsxqQkyTAP8ejJHSuWUC45/fn7uZPY5GRDzcAjOWVTchGCgsFDLYgx
	w6EY3dDdCGu9tP22gyKkJHj//Tqqlh7SN5+3fLrVZ2A3eHKrrNd+cndm7R52ZbzTzZVD
	BNBvMJYNZh51yL0gxL8mGYXBdxRo0O36X9Idqx9YjTXY8+xE1BNG8cJMvGWrcnaWdPdJ
	bzKQ==
X-Gm-Message-State: AMke39lJOKxhtkTm64xgolq8UyYtOrBobSmQXxi+8ScIeOipWUyUh4DEqoqSL/pko0QdvQ==
X-Received: by 10.129.165.75 with SMTP id c72mr15144160ywh.35.1488846313036;
	Mon, 06 Mar 2017 16:25:13 -0800 (PST)
Received: from doug-macbook.local
	(104-179-196-18.lightspeed.brhmal.sbcglobal.net. [104.179.196.18])
	by smtp.googlemail.com with ESMTPSA id
	b204sm1863906ywa.74.2017.03.06.16.25.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Mar 2017 16:25:12 -0800 (PST)
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
	meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
	meta-virtualization@yoctoproject.org
References: <CAFL6qn6HmUcfTsGRYmRuJ9zf10S4M2ygzWBky4R-rGGafFqE7A@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <be1ca881-d88a-eb47-2955-14388d7c8306@cardoe.com>
Date: Mon, 6 Mar 2017 18:25:11 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:45.0)
	Gecko/20100101 Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <CAFL6qn6HmUcfTsGRYmRuJ9zf10S4M2ygzWBky4R-rGGafFqE7A@mail.gmail.com>
Subject: Re: Building a Xen image on Yocto
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Mar 2017 00:25:16 -0000
X-Groupsio-MsgNum: 2463
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature";
	boundary="LQXrwjN0qO9BN8JoAQfK5o21dlQiDepOK"

--LQXrwjN0qO9BN8JoAQfK5o21dlQiDepOK
Content-Type: multipart/mixed; boundary="vdOirUW5A3mNabN770MrE0dksrIi9HK8T";
 protected-headers="v1"
From: Doug Goldstein <cardoe@cardoe.com>
To: Pello Heriz <pello.heriz@alumni.mondragon.edu>,
 meta-xilinx@yoctoproject.org, meta-xilinx-request@yoctoproject.org,
 meta-virtualization@yoctoproject.org
Message-ID: <be1ca881-d88a-eb47-2955-14388d7c8306@cardoe.com>
Subject: Re: [meta-virtualization] Building a Xen image on Yocto
References: <CAFL6qn6HmUcfTsGRYmRuJ9zf10S4M2ygzWBky4R-rGGafFqE7A@mail.gmail.com>
In-Reply-To: <CAFL6qn6HmUcfTsGRYmRuJ9zf10S4M2ygzWBky4R-rGGafFqE7A@mail.gmail.com>

--vdOirUW5A3mNabN770MrE0dksrIi9HK8T
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 3/1/17 2:05 AM, Pello Heriz wrote:
> Hi all,
>=20
> I'm trying to build a Xen image on Yocto.
>=20
> I have tried to execute bitbake xen-image-minimal command and the resul=
t
> that I've got is the next one:
>=20
> -----------------------------------------------------------------------=
----------------------------------------
> pello@pello-VirtualBox:/opt/yocto_GE/yocto_master_v2/poky/build$ bitbak=
e
> xen-image-minimal
> Loading cache: 100%
> |######################################################################=
##############|
> Time: 0:00:01
> Loaded 2782 entries from dependency cache.
> Parsing recipes: 100%
> |######################################################################=
############|
> Time: 0:00:01
> Parsing of 2007 .bb files complete (2006 cached, 1 parsed). 2783
> targets, 210 skipped, 0 masked, 0 errors.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for iasl-native (iasl-native,
> acpica-native)
> NOTE: consider defining a PREFERRED_PROVIDER entry to match iasl-native=

>=20
> Build Configuration:
> BB_VERSION        =3D "1.33.1"
> BUILD_SYS         =3D "x86_64-linux"
> NATIVELSBSTRING   =3D "universal"
> TARGET_SYS        =3D "aarch64-poky-linux"
> MACHINE           =3D "zcu102-zynqmp"
> DISTRO            =3D "poky"
> DISTRO_VERSION    =3D "2.2+snapshot-20170301"
> TUNE_FEATURES     =3D "aarch64"
> TARGET_FPU        =3D ""
> meta             =20
> meta-poky        =20
> meta-yocto-bsp    =3D "master:3c83b56309ab419f8cda72c0711479f60f61439a"=

> meta-xilinx       =3D "master:be91292d155b734acbabb13501e4781a7211cdcb"=

> meta-virtualization =3D "master:c5cd21af5f27309c7926b781852e1ef22940a10=
d"
> meta-oe          =20
> meta-networking  =20
> meta-filesystems =20
> meta-python       =3D "master:a868418132f7cbaae477a3c7bc326979700a73eb"=

> oe-meta-go        =3D "master:0712320950adf810fb324d49fba5d49ae19981b0"=

> meta-selinux      =3D "master:3b5e6bd92ef9638ba06002dc785a30d0893d9966"=

>=20
> Initialising tasks: 100%
> |######################################################################=
#########|
> Time: 0:00:15
> NOTE: Executing SetScene Tasks
> NOTE: Executing RunQueue Tasks
> ERROR: libxml2-native-2.9.4-r0 do_compile: oe_runmake failed
> ERROR: libxml2-native-2.9.4-r0 do_compile: Function failed: do_compile
> (log file is located at
> /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-=
native/2.9.4-r0/temp/log.do_compile.7516)
> ERROR: Logfile of failure stored in:
> /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-=
native/2.9.4-r0/temp/log.do_compile.7516
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 2
> | ERROR: oe_runmake failed
> | make  all-recursive
> | make[1]: Entering directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build'
> | Making all in include
> | make[2]: Entering directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include'
> | Making all in libxml
> | make[3]: Entering directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include/libxml'
> | make[3]: Nothing to be done for 'all'.
> | make[3]: Leaving directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include/libxml'
> | make[3]: Entering directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include'
> | make[3]: Nothing to be done for 'all-am'.
> | make[3]: Leaving directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include'
> | make[2]: Leaving directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build/include'
> | Making all in .
> | make[2]: Entering directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build'
> | ./x86_64-linux-libtool  --tag=3DCC   --mode=3Dlink gcc  -D_REENTRANT
> -I/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml=
2-native/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/in=
clude
>  -isystem/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux=
/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/include
> -O2 -pipe -pedantic -W -Wformat -Wno-format-extra-args -Wunused
> -Wimplicit -Wreturn-type -Wswitch -Wcomment -Wtrigraphs
> -Wchar-subscripts -Wuninitialized -Wparentheses -Wshadow -Wpointer-arit=
h
> -Wcast-align -Wwrite-strings -Waggregate-return -Wstrict-prototypes
> -Wmissing-prototypes -Wnested-externs -Winline -Wredundant-decls
> -Wno-long-long   -Wl,--version-script=3D../libxml2-2.9.4/libxml2.syms
> -version-info 11:4:9 -ldl
> -L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml=
2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
> -L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml=
2-native/2.9.4-r0/recipe-sysroot-native/lib
> -Wl,-rpath-link,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_6=
4-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
> -Wl,-rpath-link,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_6=
4-linux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib
> -Wl,-rpath,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-lin=
ux/libxml2-native/2.9.4-r0/recipe-sysroot-native/usr/lib
> -Wl,-rpath,/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-lin=
ux/libxml2-native/2.9.4-r0/recipe-sysroot-native/lib
> -Wl,-O1 -o libxml2.la <http://libxml2.la> -rpath
> /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-=
native/2.9.4-r0/recipe-sysroot-native/usr/lib
> SAX.lo entities.lo encoding.lo error.lo parserInternals.lo parser.lo
> tree.lo hash.lo list.lo xmlIO.lo xmlmemory.lo uri.lo valid.lo xlink.lo
> HTMLparser.lo HTMLtree.lo debugXML.lo xpath.lo xpointer.lo xinclude.lo
> nanohttp.lo nanoftp.lo  catalog.lo globals.lo threads.lo c14n.lo
> xmlstring.lo buf.lo xmlregexp.lo xmlschemas.lo xmlschemastypes.lo
> xmlunicode.lo  xmlreader.lo relaxng.lo dict.lo SAX2.lo xmlwriter.lo
> legacy.lo chvalid.lo pattern.lo xmlsave.lo xmlmodule.lo schematron.lo
> xzlib.lo =20
> -L/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml=
2-native/2.9.4-r0/recipe-sysroot-native/usr/lib/pkgconfig/../../../usr/li=
b
> -lz   -lm
> | x86_64-linux-libtool:   error: 'xpath.lo' is not a valid libtool obje=
ct
> | Makefile:967: recipe for target 'libxml2.la <http://libxml2.la>' fail=
ed
> | make[2]: *** [libxml2.la <http://libxml2.la>] Error 1
> | make[2]: Leaving directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build'
> | Makefile:1438: recipe for target 'all-recursive' failed
> | make[1]: *** [all-recursive] Error 1
> | make[1]: Leaving directory
> '/opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2=
-native/2.9.4-r0/build'
> | Makefile:857: recipe for target 'all' failed
> | make: *** [all] Error 2
> | WARNING:
> /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-=
native/2.9.4-r0/temp/run.do_compile.7516:1
> exit 1 from 'exit 1'
> | ERROR: Function failed: do_compile (log file is located at
> /opt/yocto_GE/yocto_master_v2/poky/build/tmp/work/x86_64-linux/libxml2-=
native/2.9.4-r0/temp/log.do_compile.7516)
> ERROR: Task
> (virtual:native:/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/li=
bxml/libxml2_2.9.4.bb:do_compile)
> failed with exit code '1'
> NOTE: Tasks Summary: Attempted 1053 tasks of which 1051 didn't need to
> be rerun and 1 failed.
>=20
> Summary: 1 task failed:
> =20
> virtual:native:/opt/yocto_GE/yocto_master_v2/poky/meta/recipes-core/lib=
xml/libxml2_2.9.4.bb:do_compile
> Summary: There were 2 ERROR messages shown, returning a non-zero exit c=
ode.
> -----------------------------------------------------------------------=
----------------------------------------
>=20
> In the other hand, I have add all this layers in the bblayers.conf file=
:
>=20
> -----------------------------------------------------------------------=
----------------------------------------
> BBLAYERS ?=3D " \
>   /opt/yocto_GE/yocto_master_v2/poky/meta \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-poky \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-yocto-bsp \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-xilinx \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-virtualization \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-oe \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-networking =
\
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-filesystems=
 \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-openembedded/meta-python \
>   /opt/yocto_GE/yocto_master_v2/poky/oe-meta-go \
>   /opt/yocto_GE/yocto_master_v2/poky/meta-selinux \
>   "
> -----------------------------------------------------------------------=
----------------------------------------
>=20
> What should I do to solve the issue?
> Looking forward to an answer,
> Regards,
> Pello
>=20
>=20

You a stable release like morty instead of using master where there
might be breakage.

--=20
Doug Goldstein


--vdOirUW5A3mNabN770MrE0dksrIi9HK8T--

--LQXrwjN0qO9BN8JoAQfK5o21dlQiDepOK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJYvf3nXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUUwgP+wWQQIa8G+gg8HDPi+NLwPkg
XQQ45fl2U55rrclnw2LopbeFWFPEqpZHgLI1sKGeIa9ybBP87d9Ge1dv21hoaS0D
i+ENJbjruKQV/UwPBJSzOKHqWbsk18SLzqtEBovtlY94W9pEYekANFjj5CXn5Eqy
TJBuFBLaRqNGvs4WcT9baUw1/w/pj/+ubORPJrOPgnWCjruE33DUyaEKr597rKcG
vYRzYPtE6n8H1+E2LKWCz+r1uaDqwBJo1/JmCjVpeBSRyr9FNk8Sd+oSsruSuAX2
SFHLADP833+deaMRLg4pbs5A4PtdYIxyx4ouzjPzfB6eRIG3PBhNjkUd4mmzrTAw
OL+lFKg0luvhbnI7QrI85csMtdUvhUXh/sfPyA0fXhPmOON+rJZH5V0hjB2wfgX/
amg+dOsOCMyxA2EeE6KBzuAiIgCWg7C7NroEXw0IZAJD+c+89c3NHHexfihaJkE+
P3DfHhosXL+bbKtWbiOp9ucnGGkat8ZdQyrn29D5mpbIxEuyqpVRJsyiHaF+6cIH
HZNl3+M1S/EKZzA9ob2kZ1n1X5KNo62SJowkdojN0FsencFrpTE6ft7c7Mp+oJAO
3c2MbZIZriikcWcNrCwJuYF5NwKh3wkm47YVYEcKhGIpngbDaawZ66OEx1z+sBZ9
uzzSiDCeD2ig8/tLmity
=j3S5
-----END PGP SIGNATURE-----

--LQXrwjN0qO9BN8JoAQfK5o21dlQiDepOK--
