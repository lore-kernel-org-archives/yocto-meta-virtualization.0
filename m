Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 9532EE00D77; Tue, 16 Jul 2019 12:43:18 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	https://www.dnswl.org/, no *      trust
	*      [209.85.208.195 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com
	[209.85.208.195])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8B976E006B6
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:43:16 -0700 (PDT)
Received: by mail-lj1-f195.google.com with SMTP id d24so21163380ljg.8
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Jul 2019 12:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bSvVGlRjAAJKHrEPVYUF6AlxFHxPZEgPzyNhjq2TjxQ=;
	b=Gl9Ofx2z/pBFKMY6yk1RxUBWFTYHI2O5h6AdHrHeULDb6iMlopscA2oxcanp2O8j1I
	px0An6qd1ngREzoLUA5vgsfsI6R+slpLUSIXGMuZRUvau1JjRlFRXUuHtgufiJQzUCjK
	aTIBHxSgFHcwscpxsrW2TT18PP/i3svf/xaKHgLCzKKdFn2hp7LC6k176HfgRVfP/lis
	G4u9C2wSoIlcbqFkkOAeGo2ZfdN6wQTaFqZyuQV5OS1lGamaLB9istIXlUFCO9pBFhEQ
	H75x7zbyKRXW+hIh5qMeZ1x9pEX+py9N4XzF247iI1uLNh+N1K4Mf87Ncd/4a6vPPaki
	2mmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bSvVGlRjAAJKHrEPVYUF6AlxFHxPZEgPzyNhjq2TjxQ=;
	b=N4lHUYJtFFS+kRTJ9hI5i9t/tqw/jl9VOj28JvnusZ2TTTeODTQqTfZfzNi90CFzJX
	mJEHcKxHUudCHKfUWVm9jcnKWPrzjX7KVWY+0zmba35NvQhvsMtJGd1j/b87djjEnXC8
	My+r7Ltk35knNpgJ/xKdH6l6vFsEnRUm13IcgAG5hkCWVglt4+burAqygM0+2oOchE5t
	mNlFJ93V+bC1oHSVcHPg1hIND34Xgy0LH9WYBxEMVwwI4EdTtEEkRKYp3QcbRW/2dZS+
	8iYhWGF7UX/r/fG6dUtC6LAH8AlFoyIRBoxLF0/c54WSq6NOEZAwKM6eTSa41YALwb8v
	/5lg==
X-Gm-Message-State: APjAAAXOxLmQnjH4ApYZ9rW0fQXPb/AG+Mi3CqVEr4ZALiC1e8YFBdPN
	fMOTvLcYQLPDelaG9PGbrzjOxw9q0Y7lSKb2zQeb4d7W
X-Google-Smtp-Source: APXvYqwmiW8F9i4dDqEous86ZQR+YepeDc2hxidC/+k7zxD9T6YNerJwyyNjf1EPvTiqDH+xeWCSXa/xbwBL0MlrYSE=
X-Received: by 2002:a2e:2b57:: with SMTP id q84mr18586302lje.105.1563306195513;
	Tue, 16 Jul 2019 12:43:15 -0700 (PDT)
MIME-Version: 1.0
References: <1562992383-136624-1-git-send-email-zhe.he@windriver.com>
In-Reply-To: <1562992383-136624-1-git-send-email-zhe.he@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Jul 2019 15:43:04 -0400
Message-ID: <CADkTA4Oj4RbXg73b+uGisPKv+rNsOrPLsNdU1eF-vBJr4miYwg@mail.gmail.com>
To: He Zhe <zhe.he@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH v2] libvirt: libvirtd: Facilitate using tls connection mode
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
X-List-Received-Date: Tue, 16 Jul 2019 19:43:18 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Sat, Jul 13, 2019 at 12:33 AM <zhe.he@windriver.com> wrote:
>
> From: He Zhe <zhe.he@windriver.com>
>
> tls is the default network connection mode of libvirtd upstream, though we use
> tcp mode as default.
>
> tls requires necessary keys and certificates of certificate authority, server
> and client to be properly generated and deployed. Otherwise servers and clients
> cannot be connected.
>
> This patch,
>  - integrates sample keys and certificats of certificate authority, server and
>    client for users to be able to use tls mode out of box.
>  - sets default server IP address to 127.0.0.1 for users to use local client out
>    of box.
>  - integrates certtool and provides gnutls-help.py for users to generate keys
>    and certificates on targets in their own ways.
>  - adds a PACKAGECONFIG option "gnutls" to control all of the above integration
>    but disables it to keep the same default behavior as before.
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
> v2:
>  - Rebase on 5.5.0
>  - Add license header and copyright
>  - Python3nize gnutls-helper
>  - Simplify addtion to FILES with wildcard
>
>  recipes-extended/libvirt/README                   |  26 +++++
>  recipes-extended/libvirt/libvirt/gnutls-helper.py | 136 ++++++++++++++++++++++
>  recipes-extended/libvirt/libvirt_5.5.0.bb         |  28 ++++-
>  3 files changed, 189 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-extended/libvirt/README
>  create mode 100755 recipes-extended/libvirt/libvirt/gnutls-helper.py
>
> diff --git a/recipes-extended/libvirt/README b/recipes-extended/libvirt/README
> new file mode 100644
> index 0000000..af4fd17
> --- /dev/null
> +++ b/recipes-extended/libvirt/README
> @@ -0,0 +1,26 @@
> +libvirt default connection mode between client(where for example virsh runs) and
> +server(where libvirtd runs) is tls which requires keys and certificates for
> +certificate authority, client and server to be properly generated and deployed.
> +Otherwise, servers and clients cannot be connected.
> +
> +recipes-extended/libvirt/libvirt/gnutls-help.py is provided to help generate
> +required keys and certificates.
> +
> +Usage:
> +gnutls-help.py [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info>
> +If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.
> +
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> +!! "ip_address" field of server.info must be IP address of the server. !!
> +!! For more details, please refer to:                                  !!
> +!! https://libvirt.org/remote.html#Remote_certificates                 !!
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> +
> +Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cacert.pem
> +Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverkey.pem
> +Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
> +Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientkey.pem
> +Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
> +
> +For more details please refer to libvirt official document,
> +https://libvirt.org/remote.html#Remote_certificates
> diff --git a/recipes-extended/libvirt/libvirt/gnutls-helper.py b/recipes-extended/libvirt/libvirt/gnutls-helper.py
> new file mode 100755
> index 0000000..b994946
> --- /dev/null
> +++ b/recipes-extended/libvirt/libvirt/gnutls-helper.py
> @@ -0,0 +1,136 @@
> +#!/usr/bin/env python3
> +#
> +# Copyright (C) 2019 Wind River Systems, Inc.
> +#
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +
> +import os, sys, getopt
> +
> +banner = \
> +'''\
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> +!! "ip_address" field of server.info must be IP address of the server. !!
> +!! For more details, please refer to:                                  !!
> +!! https://libvirt.org/remote.html#Remote_certificates                 !!
> +!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
> +
> +Please deploy cacert.pem     to CA and server and client /etc/pki/CA/cacert.pem
> +Please deploy serverkey.pem  to server /etc/pki/libvirt/private/serverkey.pem
> +Please deploy servercert.pem to server /etc/pki/libvirt/servercert.pem
> +Please deploy clientkey.pem  to client /etc/pki/libvirt/private/clientkey.pem
> +Please deploy clientcert.pem to client /etc/pki/libvirt/clientcert.pem"
> +'''
> +
> +if os.system('which certtool > /dev/null 2>&1') != 0:
> +    print('certtool is not available. It is provided by \n\
> +gnutls-bin on Yocto like Linux or \n\
> +gnutls-bin on Debian like distribution or \n\
> +gnutls-utils on Redhat like distribution.')
> +    sys.exit()
> +
> +cainfo = ""
> +serverinfo = ""
> +clientinfo = ""
> +yes = 0
> +
> +try:
> +    opts, args = getopt.getopt(sys.argv[1:], "ha:b:c:y", ["help", "ca-info=", "server-info=", "client-info=", "yes"])
> +except getopt.GetoptError:
> +    print('Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0]))
> +    print('If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.')
> +    sys.exit(2)
> +for opt, arg in opts:
> +    if opt in ("-h", "--help"):
> +        print('Usage:\n{} [-a|--ca-info] <ca.info> [-b|--server-info] <server.info> [-c|--client-info] <client.info> [-y|--yes]'.format(sys.argv[0]))
> +        print('If ca.info or server.info or client.info is not provided, a corresponding sample file will be generated.\n')
> +        print(banner)
> +        sys.exit()
> +    elif opt in ("-a", "--ca-info"):
> +        cainfo = arg
> +    elif opt in ("-b", "--server-info"):
> +        serverinfo = arg
> +    elif opt in ("-c", "--client-info"):
> +        clientinfo = arg
> +    elif opt in ("-y", "--yes"):
> +        yes = 1
> +
> +cainfodefault = \
> +'''cn = CA
> +ca
> +cert_signing_key
> +'''
> +
> +serverinfodefault = \
> +'''organization = Organization
> +cn = Server
> +dns_name = DNS Name
> +ip_address = 127.0.0.1
> +tls_www_server
> +encryption_key
> +signing_key
> +'''
> +
> +clientinfodefault = \
> +'''country = Country
> +state = State
> +locality = Locality
> +organization = Organization
> +cn = Client
> +tls_www_client
> +encryption_key
> +signing_key
> +'''
> +
> +if not cainfo:
> +    if yes == 0:
> +        opt = input('{}\nca.info not provided by -a, the above will be used [y/n]?'.format(cainfodefault))
> +        if opt != 'y':
> +            exit()
> +    cainfo = "ca.info"
> +    with open(cainfo, mode='w') as f:
> +        f.write(cainfodefault)
> +
> +if not serverinfo:
> +    if yes == 0:
> +        opt = input('{}\nserver.info not provided by -b, the above will be used [y/n]?'.format(serverinfodefault))
> +        if opt != 'y':
> +            exit()
> +    serverinfo = "server.info"
> +    with open(serverinfo, mode='w') as f:
> +        f.write(serverinfodefault)
> +
> +if not clientinfo:
> +    if yes == 0:
> +        opt = input('{}\nclient.info not provided by -c, the above will be used [y/n]?'.format(clientinfodefault))
> +        if opt != 'y':
> +            sys.exit()
> +    clientinfo = "client.info"
> +    with open(clientinfo, mode='w') as f:
> +        f.write(clientinfodefault)
> +
> +if os.system("certtool --generate-privkey > cakey.pem") != 0:
> +    print('ca private key failed.')
> +    sys.exit()
> +
> +if os.system("certtool --generate-self-signed --load-privkey cakey.pem --template {} --outfile cacert.pem".format(cainfo)) != 0:
> +    print('ca cert failed.')
> +    sys.exit()
> +
> +if os.system("certtool --generate-privkey > serverkey.pem") != 0:
> +    print('server private key failed.')
> +    sys.exit()
> +
> +if os.system("certtool --generate-certificate --load-privkey serverkey.pem --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template {} --outfile servercert.pem".format(serverinfo)) != 0:
> +    print('server cert failed.')
> +    sys.exit()
> +
> +if os.system("certtool --generate-privkey > clientkey.pem") != 0:
> +    print('client private key failed.')
> +    sys.exit()
> +
> +if os.system("certtool --generate-certificate --load-privkey clientkey.pem --load-ca-certificate cacert.pem --load-ca-privkey cakey.pem --template {} --outfile clientcert.pem".format(clientinfo)) != 0:
> +    print('client cert failed.')
> +    sys.exit()
> +
> +print(banner)
> diff --git a/recipes-extended/libvirt/libvirt_5.5.0.bb b/recipes-extended/libvirt/libvirt_5.5.0.bb
> index 222654a..26800b7 100644
> --- a/recipes-extended/libvirt/libvirt_5.5.0.bb
> +++ b/recipes-extended/libvirt/libvirt_5.5.0.bb
> @@ -8,7 +8,8 @@ SECTION = "console/tools"
>
>  DEPENDS = "bridge-utils gnutls libxml2 lvm2 avahi parted curl libpcap util-linux e2fsprogs pm-utils \
>            iptables dnsmasq readline libtasn1 libxslt-native acl libdevmapper libtirpc \
> -          ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)}"
> +          ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'shadow-native', '', d)} \
> +          ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', 'gnutls-native', '', d)}"
>
>  # libvirt-guests.sh needs gettext.sh
>  #
> @@ -36,6 +37,7 @@ SRC_URI = "http://libvirt.org/sources/libvirt-${PV}.tar.xz;name=libvirt \
>             file://0001-ptest-Remove-Windows-1252-check-from-esxutilstest.patch \
>             file://configure.ac-search-for-rpc-rpc.h-in-the-sysroot.patch \
>             file://hook_support.py \
> +           file://gnutls-helper.py \
>            "
>
>  SRC_URI[libvirt.md5sum] = "27c5fb6c8d2d46eb9e8165aeb3b499b0"
> @@ -119,6 +121,7 @@ FILES_${PN}-libvirtd = " \
>         ${sbindir}/libvirtd \
>         ${systemd_unitdir}/system/* \
>         ${@bb.utils.contains('DISTRO_FEATURES', 'sysvinit', '', '${libexecdir}/libvirt-guests.sh', d)} \
> +       ${@bb.utils.contains('PACKAGECONFIG', 'gnutls', '${sysconfdir}/pki/libvirt/* ${sysconfdir}/pki/CA/*', '', d)} \
>          "
>
>  FILES_${PN}-virsh = " \
> @@ -198,6 +201,7 @@ PACKAGECONFIG_remove_mipsarchn64 = "qemu"
>
>  # enable,disable,depends,rdepends
>  #
> +PACKAGECONFIG[gnutls] = ",,,gnutls-bin"
>  PACKAGECONFIG[qemu] = "--with-qemu --with-qemu-user=qemu --with-qemu-group=qemu,--without-qemu,qemu,"
>  PACKAGECONFIG[yajl] = "--with-yajl,--without-yajl,yajl,yajl"
>  PACKAGECONFIG[xenapi] = "--with-xenapi,--without-xenapi,,"
> @@ -310,6 +314,28 @@ do_install_append() {
>         chown -R qemu:qemu ${D}/${localstatedir}/lib/libvirt/qemu
>         echo "d qemu qemu 0755 ${localstatedir}/cache/libvirt/qemu none" \
>              >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> +
> +       if ${@bb.utils.contains('PACKAGECONFIG','gnutls','true','false',d)}; then
> +           # Generate sample keys and certificates.
> +           cd ${WORKDIR}
> +           ${WORKDIR}/gnutls-helper.py -y
> +
> +           # Deploy all sample keys and certificates of CA, server and client
> +           # to target so that libvirtd is able to boot successfully and local
> +           # connection via 127.0.0.1 is available out of box.
> +           install -d ${D}/etc/pki/CA
> +           install -d ${D}/etc/pki/libvirt/private
> +           install -m 0755 ${WORKDIR}/gnutls-helper.py ${D}/${bindir}
> +           install -m 0644 ${WORKDIR}/cakey.pem ${D}/${sysconfdir}/pki/libvirt/private/cakey.pem
> +           install -m 0644 ${WORKDIR}/cacert.pem ${D}/${sysconfdir}/pki/CA/cacert.pem
> +           install -m 0644 ${WORKDIR}/serverkey.pem ${D}/${sysconfdir}/pki/libvirt/private/serverkey.pem
> +           install -m 0644 ${WORKDIR}/servercert.pem ${D}/${sysconfdir}/pki/libvirt/servercert.pem
> +           install -m 0644 ${WORKDIR}/clientkey.pem ${D}/${sysconfdir}/pki/libvirt/private/clientkey.pem
> +           install -m 0644 ${WORKDIR}/clientcert.pem ${D}/${sysconfdir}/pki/libvirt/clientcert.pem
> +
> +           # Force the connection to be tls.
> +           sed -i -e 's/^\(listen_tls\ =\ .*\)/#\1/' -e 's/^\(listen_tcp\ =\ .*\)/#\1/' ${D}/etc/libvirt/libvirtd.conf
> +       fi
>  }
>
>  EXTRA_OECONF += " \
> --
> 2.7.4
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

