Return-Path: <eddy.lai.tw@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69C85E00D18; Mon, 25 Sep 2017 17:47:43 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, HTML_MESSAGE,
	RCVD_IN_DNSWL_NONE, 
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (eddy.lai.tw[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [74.125.83.67 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [74.125.83.67 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7EEE3E00D10
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:47:42 -0700 (PDT)
Received: by mail-pg0-f67.google.com with SMTP id u18so5788249pgo.1
	for <meta-virtualization@yoctoproject.org>;
	Mon, 25 Sep 2017 17:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=Km259pTr/9Pry5XgLBbPZsg9rZs6SW1Fk4ApFIo9yHk=;
	b=QpQNxYRpCP21jD2QUNnV3RYog/cfqFOzroLDnEvCuCHFkUdJhb/x19KCF+0WBuaX2+
	jITVStQy2jOwd0VTTN811pQO/RIIEqBx8/cPH8S+YXujWi48HfMJM4QBnrK1eaF8t/cb
	AK6QuFiTrDxAnnNZyDIddreSHxYUZsv2XRCMQMFTAo9fJCN050nNGsm5lgKf9VNROwiD
	BtPWgeg/uRVbHcitIw5ivdehDlW4gZxEGaDszfzOIjd8SeUcOREkLExltVgEayVV0UUt
	BlSDDJQaKX53sLr7lPgPToiUkhr0mHjZqH+XwLLl3rkIKFdgXGJrP+JVQTggNF+1WzbE
	LCfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=Km259pTr/9Pry5XgLBbPZsg9rZs6SW1Fk4ApFIo9yHk=;
	b=DcK7rGlEdl3Ykuj8q/0ezWh6dXbZZq/ZpYJbi7cf3zwseN7x7v9+VxiIhBOJ7NYF+2
	PRrKadkqJ4nx1gPjq0eOODCrIIpPQKCmpoYyr7md99RPBEIPBH/iSvG8qZz/kR7+7Vep
	Hr+/Vg6W0W4Ldbgz0+FNXAaH/YqC5UVdV4UsZa1a/8/ne9EXOQmenYfc4QxO4lm1aCpT
	g035O9yqQ1NPwuypQxhxvrGVaJy7DIlLxlaagB1IeiPtpjQveRQZkNsELj23JHhPGPoa
	U2x97ZjcYeIDAsV8zyumRi0N2SqlLVklLnwkPSMGP8LGDBm/d4oC0dDmPIGDv9PzX2P4
	CP8Q==
X-Gm-Message-State: AHPjjUhzNqaKbft666HQDGN/6qiggDdmKsDyMibIpvMISzvaVB9/LVp7
	SDeXpFJh5QlG6iQS7xW07xf5FGs0VCvCMkwtzjI=
X-Google-Smtp-Source: AOwi7QB0551uxHUiDqbo7mpJk419LRoA8fjmxw8gXxnIHqEqfR0wDtNDGwjW07W3ooI5F2qvuVAu4XtxwifTw18ZtR8=
X-Received: by 10.84.131.105 with SMTP id 96mr9328997pld.229.1506386861804;
	Mon, 25 Sep 2017 17:47:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.130.151 with HTTP; Mon, 25 Sep 2017 17:47:41 -0700 (PDT)
From: Lai Eddy <eddy.lai.tw@gmail.com>
Date: Tue, 26 Sep 2017 08:47:41 +0800
Message-ID: <CACrgodd-pndXEkJujo2SvqmqM44UZruZzxjv4DAcW+uYPr9-4g@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [meta-cloud-services] open-iscsi-kernel build error
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
X-List-Received-Date: Tue, 26 Sep 2017 00:47:43 -0000
Content-Type: multipart/alternative; boundary="94eb2c130b7ccad02f055a0d057d"

--94eb2c130b7ccad02f055a0d057d
Content-Type: text/plain; charset="UTF-8"

I want to use iscsi in my yocto project so I add
open-iscsi-kernel and open-iscsi-kernel
into my local.conf
but got following build error
---------------------------------------------------------------
ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: oe_runmake failed
ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: Function failed: do_compile
(log file is located at /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/temp/log.do_compile.1691)
ERROR: Logfile of failure stored in: /home/user/poky/build/tmp/
work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-
873-r2/temp/log.do_compile.1691
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8
KERNEL_SRC=/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source
KSRC=/home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source
LDFLAGS= kernel
| make -C kernel
| make[1]: Entering directory '/home/user/poky/build/tmp/
work/intel_corei7_64-poky-linux/open-iscsi-kernel/2.0-
873-r2/open-iscsi-2.0-873/kernel'
| echo "Patching source code for linux-2.6.28-33 ..."
| Patching source code for linux-2.6.28-33 ...
| if [ -e cur_patched ]; then \
| make -C . clean; \
| fi
| patch -p1 < 2.6.28-32_compat.patch
| patching file iscsi_tcp.c
| patching file libiscsi.c
| patching file libiscsi.h
| patching file libiscsi_tcp.c
| patching file libiscsi_tcp.h
| patching file open_iscsi_compat.h
| cp 2.6.28-32_compat.patch has_28to32_patch
| ln -s has_28to32_patch cur_patched
| make -C /home/user/poky/build/tmp/work-shared/intel-corei7-64/kernel-source
M=`pwd` KBUILD_OUTPUT=/home/user/poky/build/tmp/work-shared/intel-
corei7-64/kernel-build-artifacts  V=0 modules
| make[2]: Entering directory '/home/user/poky/build/tmp/
work-shared/intel-corei7-64/kernel-source'
| make[3]: Entering directory '/home/user/poky/build/tmp/
work-shared/intel-corei7-64/kernel-build-artifacts'
|   CC [M]  /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/
kernel/scsi_transport_iscsi.o
|   CC [M]  /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/libiscsi.o
|   CC [M]  /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/libiscsi_tcp.o
|   CC [M]  /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.o
| In file included from /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/
kernel/iscsi_tcp.c:47:0:
| /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.h:48:19:
error: field 'tx_hash' has incomplete type
|   struct hash_desc tx_hash; /* CRC32C (Tx) */
|                    ^~~~~~~
| /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.h:49:19:
error: field 'rx_hash' has incomplete type
|   struct hash_desc rx_hash; /* CRC32C (Rx) */
|                    ^~~~~~~
| /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.c:
In function 'iscsi_sw_tcp_conn_set_callbacks':
| /home/user/poky/build/tmp/work/intel_corei7_64-poky-
linux/open-iscsi-kernel/2.0-873-r2/open-iscsi-2.0-873/kernel/iscsi_tcp.c:201:30:
error: assignment from incompatible pointer type
[-Werror=incompatible-pointer-types]
|   tcp_sw_conn->old_data_ready = sk->sk_data_ready;

my build environment is:
----------------------------------------
Build Configuration:
BB_VERSION        = "1.34.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "universal"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "intel-corei7-64"
DISTRO            = "poky"
DISTRO_VERSION    = "2.3.1"
TUNE_FEATURES     = "m64 corei7"

--94eb2c130b7ccad02f055a0d057d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">I want to use iscsi in my yocto=
 project so I add=C2=A0</div><div class=3D"gmail_extra">open-iscsi-kernel a=
nd open-iscsi-kernel</div><div class=3D"gmail_extra">into my local.conf</di=
v><div class=3D"gmail_extra">but got following build error</div><div class=
=3D"gmail_extra">------------------------------<wbr>-----------------------=
-------<wbr>---</div><div class=3D"gmail_extra"><div class=3D"gmail_extra">=
ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: oe_runmake failed</div><div=
 class=3D"gmail_extra">ERROR: open-iscsi-kernel-2.0-873-r2 do_compile: Func=
tion failed: do_compile (log file is located at /home/user/poky/build/tmp/<=
wbr>work/intel_corei7_64-poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/=
temp/log.do_compile.<wbr>1691)</div><div class=3D"gmail_extra">ERROR: Logfi=
le of failure stored in: /home/user/poky/build/tmp/<wbr>work/intel_corei7_6=
4-poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/temp/log.do_compile.<wb=
r>1691</div><div class=3D"gmail_extra">Log data follows:</div><div class=3D=
"gmail_extra">| DEBUG: Executing shell function do_compile</div><div class=
=3D"gmail_extra">| NOTE: make -j 8 KERNEL_SRC=3D/home/user/poky/<wbr>build/=
tmp/work-shared/intel-<wbr>corei7-64/kernel-source KSRC=3D/home/user/poky/b=
uild/<wbr>tmp/work-shared/intel-corei7-<wbr>64/kernel-source LDFLAGS=3D ker=
nel</div><div class=3D"gmail_extra">| make -C kernel</div><div class=3D"gma=
il_extra">| make[1]: Entering directory &#39;/home/user/poky/build/tmp/<wbr=
>work/intel_corei7_64-poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/ope=
n-iscsi-2.0-873/<wbr>kernel&#39;</div><div class=3D"gmail_extra">| echo &qu=
ot;Patching source code for linux-2.6.28-33 ...&quot;</div><div class=3D"gm=
ail_extra">| Patching source code for linux-2.6.28-33 ...</div><div class=
=3D"gmail_extra">| if [ -e cur_patched ]; then \</div><div class=3D"gmail_e=
xtra">| <span style=3D"white-space:pre-wrap">	</span>make -C . clean; \</di=
v><div class=3D"gmail_extra">| fi</div><div class=3D"gmail_extra">| patch -=
p1 &lt; 2.6.28-32_compat.patch</div><div class=3D"gmail_extra">| patching f=
ile iscsi_tcp.c</div><div class=3D"gmail_extra">| patching file libiscsi.c<=
/div><div class=3D"gmail_extra">| patching file libiscsi.h</div><div class=
=3D"gmail_extra">| patching file libiscsi_tcp.c</div><div class=3D"gmail_ex=
tra">| patching file libiscsi_tcp.h</div><div class=3D"gmail_extra">| patch=
ing file open_iscsi_compat.h</div><div class=3D"gmail_extra">| cp 2.6.28-32=
_compat.patch has_28to32_patch</div><div class=3D"gmail_extra">| ln -s has_=
28to32_patch cur_patched</div><div class=3D"gmail_extra">| make -C /home/us=
er/poky/build/tmp/<wbr>work-shared/intel-corei7-64/<wbr>kernel-source M=3D`=
pwd` KBUILD_OUTPUT=3D/home/user/poky/<wbr>build/tmp/work-shared/intel-<wbr>=
corei7-64/kernel-build-<wbr>artifacts=C2=A0 V=3D0 modules</div><div class=
=3D"gmail_extra">| make[2]: Entering directory &#39;/home/user/poky/build/t=
mp/<wbr>work-shared/intel-corei7-64/<wbr>kernel-source&#39;</div><div class=
=3D"gmail_extra">| make[3]: Entering directory &#39;/home/user/poky/build/t=
mp/<wbr>work-shared/intel-corei7-64/<wbr>kernel-build-artifacts&#39;</div><=
div class=3D"gmail_extra">|=C2=A0 =C2=A0CC [M]=C2=A0 /home/user/poky/build/=
tmp/<wbr>work/intel_corei7_64-poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>87=
3-r2/open-iscsi-2.0-873/<wbr>kernel/scsi_transport_iscsi.o</div><div class=
=3D"gmail_extra">|=C2=A0 =C2=A0CC [M]=C2=A0 /home/user/poky/build/tmp/<wbr>=
work/intel_corei7_64-poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/open=
-iscsi-2.0-873/<wbr>kernel/libiscsi.o</div><div class=3D"gmail_extra">|=C2=
=A0 =C2=A0CC [M]=C2=A0 /home/user/poky/build/tmp/<wbr>work/intel_corei7_64-=
poky-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>k=
ernel/libiscsi_tcp.o</div><div class=3D"gmail_extra">|=C2=A0 =C2=A0CC [M]=
=C2=A0 /home/user/poky/build/tmp/<wbr>work/intel_corei7_64-poky-<wbr>linux/=
open-iscsi-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>kernel/iscsi_tcp.=
o</div><div class=3D"gmail_extra">| In file included from /home/user/poky/b=
uild/tmp/<wbr>work/intel_corei7_64-poky-<wbr>linux/open-iscsi-kernel/2.0-<w=
br>873-r2/open-iscsi-2.0-873/<wbr>kernel/iscsi_tcp.c:47:0:</div><div class=
=3D"gmail_extra">| /home/user/poky/build/tmp/<wbr>work/intel_corei7_64-poky=
-<wbr>linux/open-iscsi-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>kerne=
l/iscsi_tcp.h:48:19: error: field &#39;tx_hash&#39; has incomplete type</di=
v><div class=3D"gmail_extra">|=C2=A0 =C2=A0struct hash_desc tx_hash; /* CRC=
32C (Tx) */</div><div class=3D"gmail_extra">|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div><div class=3D"gmail_=
extra">| /home/user/poky/build/tmp/<wbr>work/intel_corei7_64-poky-<wbr>linu=
x/open-iscsi-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>kernel/iscsi_tc=
p.h:49:19: error: field &#39;rx_hash&#39; has incomplete type</div><div cla=
ss=3D"gmail_extra">|=C2=A0 =C2=A0struct hash_desc rx_hash; /* CRC32C (Rx) *=
/</div><div class=3D"gmail_extra">|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^~~~~~~</div><div class=3D"gmail_extra">| /=
home/user/poky/build/tmp/<wbr>work/intel_corei7_64-poky-<wbr>linux/open-isc=
si-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>kernel/iscsi_tcp.c: In fu=
nction &#39;iscsi_sw_tcp_conn_set_<wbr>callbacks&#39;:</div><div class=3D"g=
mail_extra">| /home/user/poky/build/tmp/<wbr>work/intel_corei7_64-poky-<wbr=
>linux/open-iscsi-kernel/2.0-<wbr>873-r2/open-iscsi-2.0-873/<wbr>kernel/isc=
si_tcp.c:201:30: error: assignment from incompatible pointer type [-Werror=
=3Dincompatible-pointer-<wbr>types]</div><div class=3D"gmail_extra">|=C2=A0=
 =C2=A0tcp_sw_conn-&gt;old_data_ready =3D sk-&gt;sk_data_ready;</div><div><=
br></div><div>my build environment is:</div><div>--------------------------=
----<wbr>----------</div><div><div>Build Configuration:</div><div>BB_VERSIO=
N=C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;1.34.0&quot;</div><div>BUILD_SYS=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;x86_64-linux&quot;</div><div>NATIV=
ELSBSTRING=C2=A0 =C2=A0=3D &quot;universal&quot;</div><div>TARGET_SYS=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =3D &quot;x86_64-poky-linux&quot;</div><div>MACHINE=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=3D &quot;intel-corei7-64&quot;</d=
iv><div>DISTRO=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =3D &quot;poky&quot=
;</div><div>DISTRO_VERSION=C2=A0 =C2=A0 =3D &quot;2.3.1&quot;</div><div>TUN=
E_FEATURES=C2=A0 =C2=A0 =C2=A0=3D &quot;m64 corei7&quot;</div></div><div><b=
r></div></div></div>

--94eb2c130b7ccad02f055a0d057d--
