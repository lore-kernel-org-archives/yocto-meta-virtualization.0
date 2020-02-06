Received: from mail5.wrs.com (mail5.wrs.com [192.103.53.11])
 by mx.groups.io with SMTP id smtpd.web11.6121.1580955621267685885
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 05 Feb 2020 18:20:21 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 192.103.53.11, mailfrom: qi.chen@windriver.com)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com [147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id 0162JgkV003243
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL);
	Wed, 5 Feb 2020 18:19:53 -0800
Received: from ALA-MBD.corp.ad.wrs.com ([169.254.3.34]) by
 ALA-HCA.corp.ad.wrs.com ([147.11.189.40]) with mapi id 14.03.0468.000; Wed, 5
 Feb 2020 18:19:32 -0800
From: "Chen Qi" <Qi.Chen@windriver.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
CC: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
Subject: Re: [meta-virtualization][PATCH] openvswitch: backport patch to fix do_compile failure
Thread-Topic: [meta-virtualization][PATCH] openvswitch: backport patch to
 fix do_compile failure
Thread-Index: AQHV3D+27e2/y61wxEqBRpRXYSsS1agNbmT5
Date: Thu, 6 Feb 2020 02:19:31 +0000
Message-ID: <DBB018487F2B2F4EA51053C8975CCBF0F0A7548D@ALA-MBD.corp.ad.wrs.com>
References: <20200205053030.32955-1-Qi.Chen@windriver.com>,<CADkTA4PBHF5H7EwRqt6ESgvBh8jWkrz4qChPXuih+DcYprHtGA@mail.gmail.com>
In-Reply-To: <CADkTA4PBHF5H7EwRqt6ESgvBh8jWkrz4qChPXuih+DcYprHtGA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.16.68]
MIME-Version: 1.0
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

I'm afraid I don't time doing this work in the coming 2 weeks.
It would be great if you can uprev it. But I'd suggest we merge this patch=
 first, as it should have no negative effect.
Thanks.

Best Regards,
Chen Qi

________________________________________
From: Bruce Ashfield [bruce.ashfield@gmail.com]
Sent: Thursday, February 06, 2020 12:17 AM
To: Chen, Qi
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: backport patch to f=
ix do_compile failure

Since this is for master, I'd prefer that we uprev versus doing a patch.

Is there any issues you were seeing with just bumping the version ?

I can give it a try myself, but won't get to it until next week.

Bruce

On Wed, Feb 5, 2020 at 12:31 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Backport a patch to fix do_compile error like below.
>
>   RuntimeError: dictionary keys changed during iteration
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ....in-fix-dict-change-during-iteration.patch | 45 +++++++++++++++++++
>  .../openvswitch/openvswitch_git.bb            |  1 +
>  2 files changed, 46 insertions(+)
>  create mode 100644 recipes-networking/openvswitch/files/0001-ovsdb-idlc=
.in-fix-dict-change-during-iteration.patch
>
> diff --git a/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix=
-dict-change-during-iteration.patch b/recipes-networking/openvswitch/files/=
0001-ovsdb-idlc.in-fix-dict-change-during-iteration.patch
> new file mode 100644
> index 0000000..ecc2881
> --- /dev/null
> +++ b/recipes-networking/openvswitch/files/0001-ovsdb-idlc.in-fix-dict-c=
hange-during-iteration.patch
> @@ -0,0 +1,45 @@
> +From d84109f0b60096ce71cd0537b31b69a7f5ea8756 Mon Sep 17 00:00:00 2001
> +From: Flavio Leitner <fbl@sysclose.org>
> +Date: Sat, 14 Sep 2019 20:17:28 -0300
> +Subject: [PATCH] ovsdb-idlc.in: fix dict change during iteration.
> +
> +Python3 complains if a dict key is changed during the
> +iteration.
> +
> +Use list() to create a copy of it.
> +
> +Traceback (most recent call last):
> +  File "./ovsdb/ovsdb-idlc.in", line 1581, in <module>
> +    func(*args[1:])
> +  File "./ovsdb/ovsdb-idlc.in", line 185, in printCIDLHeader
> +    replace_cplusplus_keyword(schema)
> +  File "./ovsdb/ovsdb-idlc.in", line 179, in replace_cplusplus_keyword
> +    for columnName in table.columns:
> +RuntimeError: dictionary keys changed during iteration
> +
> +Signed-off-by: Flavio Leitner <fbl@sysclose.org>
> +Signed-off-by: Ben Pfaff <blp@ovn.org>
> +
> +Upstream-Status: Backport [https://github.com/openvswitch/ovs/commit/d8=
4109f0b60096ce71cd0537b31b69a7f5ea8756]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + ovsdb/ovsdb-idlc.in | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/ovsdb/ovsdb-idlc.in b/ovsdb/ovsdb-idlc.in
> +index 40fef39ed..22d0a4e22 100755
> +--- a/ovsdb/ovsdb-idlc.in
> ++++ b/ovsdb/ovsdb-idlc.in
> +@@ -176,7 +176,7 @@ def replace_cplusplus_keyword(schema):
> +                 'wchar_t', 'while', 'xor', 'xor_eq'}
> +
> +     for tableName, table in schema.tables.items():
> +-        for columnName in table.columns:
> ++        for columnName in list(table.columns):
> +             if columnName in keywords:
> +                 table.columns[columnName + '_'] =3D table.columns.pop(=
columnName)
> +
> +--
> +2.21.0
> +
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes=
-networking/openvswitch/openvswitch_git.bb
> index 072d7f1..fc8777a 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -33,6 +33,7 @@ SRC_URI =3D "file://openvswitch-switch \
>             file://python-switch-remaining-scripts-to-use-python3.patch =
\
>             file://systemd-update-tool-paths.patch \
>             file://systemd-create-runtime-dirs.patch \
> +           file://0001-ovsdb-idlc.in-fix-dict-change-during-iteration.p=
atch \
>             "
>
>  LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D1ce5d23a6429dff345518758f13a=
aeab"
> --
> 2.21.0
>
>=20



--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
