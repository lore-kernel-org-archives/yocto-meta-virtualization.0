Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E4952E00C6A; Tue,  9 Jul 2019 12:17:22 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.196 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com
	[209.85.208.196])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id E37AEE00BF7
	for <meta-virtualization@yoctoproject.org>;
	Tue,  9 Jul 2019 12:17:20 -0700 (PDT)
Received: by mail-lj1-f196.google.com with SMTP id z28so11761989ljn.4
	for <meta-virtualization@yoctoproject.org>;
	Tue, 09 Jul 2019 12:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ALxRvIDBfZe2S3TCjHcK5LaWWJ32qyrekCupArztXCs=;
	b=j1WxngizIAinT3VNE9tI/8joKiioxWBDIRRGDZJXWosYpdLtqx3Ljmy+FJku1p3MQI
	vT9Ll3hgJK3L6YgKBtnYCTU4yeepsIcGKTsoOf5ZM67bi0BfGzybMzHV8CQwcY/gLOlq
	uv3Zkmh2Ny3jsQ9wG02qLvd9CCDV4YjNv8dDNRhP8dttFyAVtR/6EIY5+GPu8XEBqMiz
	Wc81EqKw0Ci+KtkDiev/Mplc/tPWD3lJ1VaBUk64mHGLk0I2GxGY4haUFVyXRHlvOyeO
	qpevT/j9QXWpmaKN0A7cMuEMOC3SmgmWMBk1h6Y9WADRTxgYgEj74+AnYvN3KVVm1L6f
	6A3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ALxRvIDBfZe2S3TCjHcK5LaWWJ32qyrekCupArztXCs=;
	b=l8FT7pLQaibzMNIF6ZTUU/kE9k7yvvrNDlxOv4Ejszf07jphg0CiJ9A8Pd9XJDLDCG
	R0VpuwKvw96VW2dH3lSVZaiCVTVH4mqJxrt3JKQHD0i6sesyO4qr8RVgC01po2YUyeh2
	lWaX68zEJHJG6kOVlwNhvg6JFRMVEtJND5vPdKR9fYgzvYi2n6/IArLY7EK1prgmnw9n
	KDVws1f2ECooqx8gTsUDoz2sEPY8lcNOTua18i7zN2u31DEh3ZkqqF3dCUOSFYx67XPt
	euUkJrEe/EZDCBVg0Zr9Q+MqyZk+9otcah/ljelPafjIPEph1byJnRLR61Vm6Uz61xdp
	w0Tg==
X-Gm-Message-State: APjAAAU2NyDtGvx2GD04RgypEVu8aBf4VZ3MpwcO7zrFGeX9n2jxAcg6
	U7ZlCwPHLTLAjb0lpDe7X9oqLeP//HqoLZR/S/N7MVke
X-Google-Smtp-Source: APXvYqxYQSIc5aKqLK3LdqM76pnWfiy5+t4O0pMF49YaBLfmkAlmC3BuhgTb0oNwUJAF87rfDlTZCjB3K6m40D6juVQ=
X-Received: by 2002:a2e:b048:: with SMTP id d8mr12362916ljl.118.1562699839648; 
	Tue, 09 Jul 2019 12:17:19 -0700 (PDT)
MIME-Version: 1.0
References: <1562307705-139903-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1562307705-139903-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 9 Jul 2019 15:17:08 -0400
Message-ID: <CADkTA4OQrSQTXcfXuiXsGyj3JJG+rx2LXjcQNcYqKH2QRkrM2A@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] libvirt: libvirtd: Facilitate using tls connection mode
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
X-List-Received-Date: Tue, 09 Jul 2019 19:17:23 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 5, 2019 at 2:22 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> tls is the default network connection mode of libvirtd upstream, though w=
e use
> tcp mode as default.
>
> tls requires necessary keys and certificates of certificate authority, se=
rver
> and client to be properly generated and deployed. Otherwise servers and c=
lients
> cannot be connected.
>
> This patch,
>  - integrates sample keys and certificats of certificate authority, serve=
r and
>    client for users to be able to use tls mode out of box.
>  - sets default server IP address to 127.0.0.1 for users to use local cli=
ent out
>    of box.
>  - integrates certtool and provides gnutls-help.py for users to generate =
keys
>    and certificates on targets in their own ways.
>  - adds a PACKAGECONFIG option "gnutls" to control all of the above integ=
ration
>    but disables it to keep the same default behavior as before.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  recipes-extended/libvirt/README                   |  26 +++++
>  recipes-extended/libvirt/libvirt/gnutls-helper.py | 130 ++++++++++++++++=
++++++
>  recipes-extended/libvirt/libvirt_5.3.0.bb         |  28 ++++-
>  3 files changed, 183 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/libvirt/README
>  create mode 100755 recipes-extended/libvirt/libvirt/gnutls-helper.py
>
> diff --git a/recipes-extended/libvirt/README b/recipes-extended/libvirt/R=
EADME
> new file mode 100644
> index 0000000..af4fd17
> --- /dev/null
> +++ b/recipes-extended/libvirt/README
> @@ -0,0 +1,26 @@
> +libvirt default connection mode between client(where for example virsh r=
uns) and
> +server(where libvirtd runs) is tls which requires keys and certificates =
for
> +certificate authority, client and server to be properly generated and de=
ployed.
> +Otherwise, servers and clients cannot be connected.
> +
> +recipes-extended/libvirt/libvirt/gnutls-help.py is provided to help gene=
rate
> +required keys and certificates.
> +
> +Usage:
> +gnutls-help.py [-a|--ca-info] <ca.info> [-b|--server-info] <server.info>=
 [-c|--client-info] <client.info>
> +If ca.info or server.info or client.info is not provided, a correspondin=
g sample file will be generated.
> +
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!
> +!! "ip_address" field of server.info must be IP address of the server. !=
!
> +!! For more details, please refer to:                                  !=
!
> +!! https://libvirt.org/remote.html#Remote_certificates                 !=
!
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!
> +
> +Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cac=
ert.pem
> +Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverke=
y.pem
> +Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
> +Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientke=
y.pem
> +Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
> +
> +For more details please refer to libvirt official document,
> +https://libvirt.org/remote.html#Remote_certificates
> diff --git a/recipes-extended/libvirt/libvirt/gnutls-helper.py b/recipes-=
extended/libvirt/libvirt/gnutls-helper.py
> new file mode 100755
> index 0000000..07acac8
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/gnutls-helper.py
> @@ -0,0 +1,130 @@
> +#!/usr/bin/python

The helper script needs a license header (and copyright if appropriate).

> +import os, sys, getopt
> +
> +banner =3D \
> +'''\
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!
> +!! "ip_address" field of server.info must be IP address of the server. !=
!
> +!! For more details, please refer to:                                  !=
!
> +!! https://libvirt.org/remote.html#Remote_certificates                 !=
!
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!=
!
> +
> +Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cac=
ert.pem
> +Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverke=
y.pem
> +Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
> +Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientke=
y.pem
> +Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
> +'''
> +
> +if os.system('which certtool > /dev/null 2>&1') !=3D 0:
> +    print 'certtool is not available. It is provided by \n\
> +gnutls-bin on Yocto like Linux or \n\
> +gnutls-bin on Debian like distribution or \n\
> +gnutls-utils on Redhat like distribution.'
> +    sys.exit()
> +
> +cainfo =3D ""
> +serverinfo =3D ""
> +clientinfo =3D ""
> +yes =3D 0
> +
> +try:
> +    opts, args =3D getopt.getopt(sys.argv[1:], "ha:b:c:y", ["help", "ca-=
info=3D", "server-info=3D", "client-info=3D", "yes"])
> +except getopt.GetoptError:
> +    print 'Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <serve=
r.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0])
> +    print 'If ca.info or server.info or client.info is not provided, a c=
orresponding sample file will be generated.'
> +    sys.exit(2)
> +for opt, arg in opts:
> +    if opt in ("-h", "--help"):
> +        print 'Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <s=
erver.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0]=
)
> +        print 'If ca.info or server.info or client.info is not provided,=
 a corresponding sample file will be generated.\n'
> +        print(banner)
> +        sys.exit()
> +    elif opt in ("-a", "--ca-info"):
> +        cainfo =3D arg
> +    elif opt in ("-b", "--server-info"):
> +        serverinfo =3D arg
> +    elif opt in ("-c", "--client-info"):
> +        clientinfo =3D arg
> +    elif opt in ("-y", "--yes"):
> +        yes =3D 1
> +
> +cainfodefault =3D \
> +'''cn =3D CA
> +ca
> +cert_signing_key
> +'''
> +
> +serverinfodefault =3D \
> +'''organization =3D Organization
> +cn =3D Server
> +dns_name =3D DNS Name
> +ip_address =3D 127.0.0.1
> +tls_www_server
> +encryption_key
> +signing_key
> +'''
> +
> +clientinfodefault =3D \
> +'''country =3D Country
> +state =3D State
> +locality =3D Locality
> +organization =3D Organization
> +cn =3D Client
> +tls_www_client
> +encryption_key
> +signing_key
> +'''
> +
> +if not cainfo:
> +    if yes =3D=3D 0:
> +        opt =3D raw_input('{}\nca.info not provided by -a, the above wil=
l be used [y/n]?'.format(cainfodefault))
> +        if opt !=3D 'y':
> +            exit()
> +    cainfo =3D "ca.info"
> +    with open(cainfo, mode=3D'w') as f:
> +        f.write(cainfodefault)
> +
> +if not serverinfo:
> +    if yes =3D=3D 0:
> +        opt =3D raw_input('{}\nserver.info not provided by -b, the above=
 will be used [y/n]?'.format(serverinfodefault))
> +        if opt !=3D 'y':
> +            exit()
> +    serverinfo =3D "server.info"
> +    with open(serverinfo, mode=3D'w') as f:
> +        f.write(serverinfodefault)
> +
> +if not clientinfo:
> +    if yes =3D=3D 0:
> +        opt =3D raw_input('{}\nclient.info not provided by -c, the above=
 will be used [y/n]?'.format(clientinfodefault))
> +        if opt !=3D 'y':
> +            sys.exit()
> +    clientinfo =3D "client.info"
> +    with open(clientinfo, mode=3D'w') as f:
> +        f.write(clientinfodefault)
> +
> +if os.system("certtool --generate-privkey > cakey.pem") !=3D 0:
> +    print 'ca private key failed.'
> +    sys.exit()
> +
> +if os.system("certtool --generate-self-signed --load-privkey cakey.pem -=
-template {} --outfile cacert.pem".format(cainfo)) !=3D 0:
> +    print 'ca cert failed.'
> +    sys.exit()
> +
> +if os.system("certtool --generate-privkey > serverkey.pem") !=3D 0:
> +    print 'server private key failed.'
> +    sys.exit()
> +
> +if os.system("certtool --generate-certificate --load-privkey serverkey.p=
em --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template =
{} --outfile servercert.pem".format(serverinfo)) !=3D 0:
> +    print 'server cert failed.'
> +    sys.exit()
> +
> +if os.system("certtool --generate-privkey > clientkey.pem") !=3D 0:
> +    print 'client private key failed.'
> +    sys.exit()
> +
> +if os.system("certtool --generate-certificate --load-privkey clientkey.p=
em --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template =
{} --outfile clientcert.pem".format(clientinfo)) !=3D 0:
> +    print 'client cert failed.'
> +    sys.exit()
> +
> +print(banner)
> diff --git a/recipes-extended/libvirt/libvirt_5.3.0.bb b/recipes-extended=
/libvirt/libvirt_5.3.0.bb
> index c54a99e..9e8dbed 100644
> --- a/recipes-extended/libvirt/libvirt_5.3.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.3.0.bb
> @@ -8,7 +8,8 @@ SECTION =3D "console/tools"
>
>  DEPENDS =3D "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap =
util-linux e2fsprogs pm-utils \
>            iptables dnsmasq readline libtasn1 libxslt-native acl libdevma=
pper libtirpc \
> -          ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native=
', '', d)}"
> +          ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native=
', '', d)} \
> +          ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native=
', '', d)}"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> @@ -36,6 +37,7 @@ SRC_URI =3D "http://libvirt.org/sources/libvirt-${PV}.t=
ar.xz;name=3Dlibvirt \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest=
.patch \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch=
 \
>             file://hook_support.py \
> +           file://gnutls-helper.py \
>            "
>
>  SRC_URI[libvirt.md5sum] =3D "1cfaaf3717783ba19850b5ac04f7e76a"
> @@ -119,6 +121,7 @@ FILES_${PN}-libvirtd =3D " \
>         ${sbindir}/libvirtd \
>         ${systemd_unitdir}/system/* \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexe=
cdir}/libvirt-guests.sh', d)} \
> +       ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pk=
i/libvirt/private/cakey.pem ${sysconfdir}/pki/CA/cacert.pem ${sysconfdir}/p=
ki/libvirt/private/serverkey.pem ${sysconfdir}/pki/libvirt/servercert.pem $=
{sysconfdir}/pki/libvirt/private/clientkey.pem ${sysconfdir}/pki/libvirt/cl=
ientcert.pem', '', d)} \

We could use some wildcards and simplify this a bit.

>          "
>
>  FILES_${PN}-virsh =3D " \
> @@ -198,6 +201,7 @@ PACKAGECONFIG_remove_mipsarchn64 =3D "qemu"
>
>  # enable,disable,depends,rdepends
>  #
> +PACKAGECONFIG[gnutls] =3D ",,,gnutls-bin"
>  PACKAGECONFIG[qemu] =3D "--with-qemu --with-qemu-user=3Dqemu --with-qemu=
-group=3Dqemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] =3D "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xenapi] =3D "--with-xenapi,--without-xenapi,,"
> @@ -310,6 +314,28 @@ do_install_append() {
>         chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
>         echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" =
\
>              >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +
> +       if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d=
)}; then
> +           # Generate sample keys and certificates.
> +           cd ${WORKDIR}
> +           ${WORKDIR}/gnutls-helper.py -y

Since the helper is being run using a python interpreter on the host,
we have an assumption that it is in /usr/bin/python .. we really
should use env and make it more generic, or we will run into host
dependency issues.

Also, I've uprev'd libvirt in master-next. Can you test against that for v2=
 ?

Bruce

> +
> +           # Deploy all sample keys and certificates of CA, server and c=
lient
> +           # to target so that libvirtd is able to boot successfully and=
 local
> +           # connection via 127.0.0.1 is available out of box.
> +           install -d ${D}/etc/pki/CA
> +           install -d ${D}/etc/pki/libvirt/private
> +           install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
> +           install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/l=
ibvirt/private/cakey.pem
> +           install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/=
CA/cacert.pem
> +           install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/p=
ki/libvirt/private/serverkey.pem
> +           install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/=
pki/libvirt/servercert.pem
> +           install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/p=
ki/libvirt/private/clientkey.pem
> +           install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/=
pki/libvirt/clientcert.pem
> +
> +           # Force the connection to be tls.
> +           sed -i -e 's/^\(listen_tls\ =3D\ .*\)/#\1/' -e 's/^\(listen_t=
cp\ =3D\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
> +       fi
>  }
>
>  EXTRA_OECONF +=3D " \
> --
> 2.7.4
>


--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

