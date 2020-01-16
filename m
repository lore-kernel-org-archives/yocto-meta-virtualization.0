Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by mx.groups.io with SMTP id smtpd.web10.3215.1579141078036007352
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 18:17:58 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linux.intel.com, ip: 192.55.52.136, mailfrom: timothy.t.orling@linux.intel.com)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 18:17:57 -0800
X-IronPort-AV: E=Sophos;i="5.70,324,1574150400"; 
   d="scan'208";a="305695172"
Received: from hagiani-mobl1.amr.corp.intel.com ([10.254.108.100])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 15 Jan 2020 18:17:57 -0800
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: [meta-virtualization][zeus][PATCH 1/2] conmon: bump to version 2.0.2
From: "Tim Orling" <timothy.t.orling@linux.intel.com>
In-Reply-To: <20200115215414.16007-1-stefan@agner.ch>
Date: Wed, 15 Jan 2020 18:17:56 -0800
Cc: meta-virtualization@lists.yoctoproject.org,
 Stefan Agner <stefan.agner@toradex.com>
Message-Id: <EA86E4B0-3787-4770-BE8A-BC58FF2E1AE8@linux.intel.com>
References: <20200115215414.16007-1-stefan@agner.ch>
To: Stefan Agner <stefan@agner.ch>
X-Mailer: Apple Mail (2.3445.104.11)
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable



> On Jan 15, 2020, at 1:54 PM, Stefan Agner <stefan@agner.ch> wrote:
>=20
> From: Stefan Agner <stefan.agner@toradex.com>
>=20
> Bump to latest version 2.0.2. This also makes our Makefile fix obsolete
> as the fix has been aplied upstream.
>=20
> Already Podman 1.6.0 actually recommended 2.0.1 and higher, with 1.6.3
> this has been made mandatory. Use conmon 2.0.2 which is also used in
> podmans build Dockerfile of the 1.6.4 release.
>=20
> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>

Acked-by: Tim Orling <timothy.t.orling@linux.intel.com>
Tested-by: Tim Orling <timothy.t.orling@linux.intel.com>

> ---
> .../{conmon_2.0.0.bb =3D> conmon_2.0.2.bb}      |  3 +-
> ...ail-if-clean-is-called-without-a-bui.patch | 31 -------------------
> 2 files changed, 1 insertion(+), 33 deletions(-)
> rename recipes-containers/conmon/{conmon_2.0.0.bb =3D> conmon_2.0.2.bb} =
(83%)
> delete mode 100644 recipes-containers/conmon/files/0001-Makefile-don-t-f=
ail-if-clean-is-called-without-a-bui.patch
>=20
> diff --git a/recipes-containers/conmon/conmon_2.0.0.bb b/recipes-contain=
ers/conmon/conmon_2.0.2.bb
> similarity index 83%
> rename from recipes-containers/conmon/conmon_2.0.0.bb
> rename to recipes-containers/conmon/conmon_2.0.2.bb
> index f4e2cd6..378c309 100644
> --- a/recipes-containers/conmon/conmon_2.0.0.bb
> +++ b/recipes-containers/conmon/conmon_2.0.2.bb
> @@ -6,10 +6,9 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D61af0b6932ea=
7b12fb9142721043bc77"
>=20
> DEPENDS =3D "glib-2.0"
>=20
> -SRCREV =3D "e217fdff82e0b1a6184a28c43043a4065083407f"
> +SRCREV =3D "65fe0226d85b69fc9e527e376795c9791199153d"
> SRC_URI =3D "\
>     git://github.com/containers/conmon.git \
> -    file://0001-Makefile-don-t-fail-if-clean-is-called-without-a-bui.pa=
tch \
> "
>=20
> SRC_URI[md5sum] =3D "5c711911d766d76813333c3812277574"
> diff --git a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if=
-clean-is-called-without-a-bui.patch b/recipes-containers/conmon/files/0001=
-Makefile-don-t-fail-if-clean-is-called-without-a-bui.patch
> deleted file mode 100644
> index 8d2b473..0000000
> --- a/recipes-containers/conmon/files/0001-Makefile-don-t-fail-if-clean-=
is-called-without-a-bui.patch
> +++ /dev/null
> @@ -1,31 +0,0 @@
> -From 6ef63dfcc65d5401bc7cc7170d569cefcdadcb38 Mon Sep 17 00:00:00 2001
> -From: Stefan Agner <stefan@agner.ch>
> -Date: Fri, 30 Aug 2019 17:49:22 +0200
> -Subject: [PATCH] Makefile: don't fail if clean is called without a buil=
d
> -
> -Do not fail when calling the clean target without building first.
> -
> -Upstream-Status: Backport
> -
> -Signed-off-by: Stefan Agner <stefan@agner.ch>
> ----
> - Makefile | 3 +--
> - 1 file changed, 1 insertion(+), 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index fb0e4fb..b525595 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -66,8 +66,7 @@ bin:
> -=20
> - .PHONY: clean
> - clean:
> --	rm -f bin/conmon src/*.o
> --	rmdir bin
> -+	rm -rf bin/ src/*.o
> -=20
> - .PHONY: install install.bin install.crio install.podman podman crio
> - install: install.bin
> ---=20
> -2.23.0
> -
> --=20
> 2.17.1
>=20
>=20

