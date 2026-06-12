Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50D48CD98D2
	for <webhook@archiver.kernel.org>; Fri, 12 Jun 2026 18:39:13 +0000 (UTC)
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.77090.1781289546486307958
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Jun 2026 11:39:06 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=C669i+PA;
 spf=pass (domain: gmail.com, ip: 209.85.222.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-9158fbaa4bbso148490685a.1
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781289545; x=1781894345; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HjtK3oZQE7RUdGBqf5NeMnlB43AeBQfq/4h8eeaC9LA=;
        b=C669i+PAx4ESQ9yeH+zAYoVPy2C6UU3kyEP4c6C3ZyM/Zy861YWporqBHRfIqB42Yn
         umlwm77vHwStUuIR80rOUlxVA+wawFYBnS1BZkUUmwYGXEWZwz7bUlYnbCp1Rd9G4FYk
         PvAPIqvqHMeNOGYd5DJAjcFL645o9EuIOfw6kPK6RPbBIFVRURDQlhTOHOJ90qUQ3ojY
         RjKHJEafK6pVztZcHeP+w9ofPMfGC3Z7eMF0llwGGhr4TG6lv8Xjl1rK+npB1O2yd2gg
         +MaKjADasDhLz4UMgMkp+1sw5Y42JVrjIaOHMGNZcucKSP0+D7CFvF23sZAA7BhwxKg6
         cz8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781289545; x=1781894345;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:date:message-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HjtK3oZQE7RUdGBqf5NeMnlB43AeBQfq/4h8eeaC9LA=;
        b=lVBLDGtoVjnPz6gFcK/NLdqhmSvEQbP6YWotshHTzZWS9n+sgOQC6u6LZZxJT4exBP
         L22q4sM8Pn+0UgjgKO2YdXE4G4CY32or3XXGjMx98uGF5mlWcKwo7LXWQNcvNP+NfhP1
         jXDxAkeR+fny1BXGfwm2eR571V8PEjVo8SD2MTQY1p57+3FS6LEMGxysd3+qKGnBbxlg
         yfatdVVxHHkJjqxahrBDBDdK8hLxgUeXwXYDLCEN13Yt3LZsYTGiyZ0X1KrDlPKWTcc9
         f0urLcRvdtR2h0aBcc4nh15xnZVZTGw6S60Ba32qx23BFGVk4J+BPQZ62B077xjupe1J
         98zA==
X-Gm-Message-State: AOJu0YyxiF3Kr7rNLbaUsMWTQPjcoiiBpPgLjw4yj0TOL476ufRPQL3y
	eY7P8Sk9qwLjtM11P300XzCHpjxYZYnbNQ632Ey+op1EMQoFRTl+4aSLv3w7VSL5
X-Gm-Gg: Acq92OHIgrhEeVOA61EcTSql3ZfJez1K8/HM4eKlVNEzG2AbYrZIWaOR7QHs20BfTGh
	X/x4lbNXqwph+Vsmw+V54c6vG0TiH99RoUYcRfAMkb8F5myd7FWqGSI7ovxBiUL9Br6zrOspcTw
	DjjDl/9fgedsek/wX3uE7vZ3/DIuiVKrEYBQG/sZ+9F426fnVXffeVFqXAXeCsS/wOw5AO7cdV9
	xAJyRSPpgJn/YPp0snpcRARpgLK/hWCxgifQoO3WNykdoFvVYSXJsj2baVv/gadAnYTy8IHw5i+
	GWgJWDYG8bR6V7gwuQgynk5MpS8zvsopBvTDEDjG/n7X+apqZ2N4Jq5kApbrZp/jrMNRYs0LQ5Z
	9RVYL58kcCueEm2qSuw45o1JT2yF7ZsbUn+4Li3xBSUx2t14EDLqCofSHbInaFzLRqJxI1+wjc8
	WQnmCKwGnZBzynre1020MVIv1h2ni10EzIw1j9/hCpnLwBdQyaPT2tC2OppZ7wDwxSKCMA6A9Jb
	18Eaq2tTODNcsIvT28+QNKLX7G9Hnv/DBX08sk9K14gMgXSmedT7F1GgoOywRIAb3x/NG5QvmR4
	M/EBSaqruTjPpyVSavO04h0G
X-Received: by 2002:a05:620a:6cc3:b0:914:bc2f:baf7 with SMTP id af79cd13be357-9161bac437bmr603722885a.4.1781289545270;
        Fri, 12 Jun 2026 11:39:05 -0700 (PDT)
Received: from [127.0.1.1] (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8d302211f20sm31021596d6.21.2026.06.12.11.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 11:39:04 -0700 (PDT)
Message-ID: <6a2c5248.b63906d5.2d75f7.bfa9@mx.google.com>
Date: Fri, 12 Jun 2026 11:39:04 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: haitao.liu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH] openvswitch: re-enable ptest
In-Reply-To: <20260601095554.460399-1-haitao.liu@windriver.com>
References: <20260601095554.460399-1-haitao.liu@windriver.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Jun 2026 18:39:13 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9877

Merged into master as 3bab1783.

One small thing to be aware of: I had to retarget the diff's context
SRCREV from 0d4c78e1 (3.7.0, what master was at when you sent the
patch) to 04b05b31 (3.7.1-tip, what master is at now after the 3.7.1
bump landed). The substantive change in the patch =E2=80=94 dropping the old
add-ptest file from SRC_URI and replacing the disabled
do_install_ptest body with the new install logic =E2=80=94 applies cleanly
either way. Same approach I used to land the paired wrynose 2/2
patch.

The wrynose variant of this is on the wrynose branch as 781735b9.

Thanks for the ptest work =E2=80=94 it's good to have ovs ptest back.

Bruce

On Mon, Jun 01, 2026 at 17:55 +0800, jason.lau wrote:
> Ptest support was disabled in commit 816d4c6e0e7c due to breakage in
> source handling that prevented proper installation of test files.
>=20
> Fix the ptest installation by:
>   - Copying test binaries from the build directory, preserving subdirectory
>     structure (e.g., oss-fuzz/) for optional test components
>   - Installing *.at test definitions and *.py test scripts from the source =
tree
>   - Fixing PYTHONPATH in atlocal to use runtime paths instead of build paths
>   - Symlinking schema files already provided by the main package to avoid
>     file duplication
>=20
> Re-enable ptest now that installation works correctly.
>=20
> Test results on genericx86-64:
>=20
> PASS: checkpatch - catastrophic backtracking
> PASS: checkpatch - Unicode code
> PASS: appctl-bashcomp - complex completion check 4
> PASS: appctl-bashcomp - complex completion check 2
> PASS: checkpatch - check misuse APIs
> PASS: checkpatch - whitespace around cast
> PASS: checkpatch - comments
> PASS: checkpatch - check egrep / fgrep
> PASS: checkpatch - file contents checks - bare return
> PASS: checkpatch - subject
> PASS: appctl-bashcomp - negative test
> ...
> ...
> ...
> PASS: drop-stats - bridge sampling
> PASS: drop-stats - sampling action
> PASS: ovsdb-idl - Check Python IDL reconnects to leader - Python3 (leader o=
nly)
> PASS: monitor-cond-change with many sessions pending
>=20
> 2658 tests were successful.
> 89 tests were skipped.
>=20
> Signed-off-by: Haitao Liu <haitao.liu@windriver.com>
> ---
>  .../openvswitch/openvswitch_git.bb            | 59 ++++++++++++++++++-
>  1 file changed, 56 insertions(+), 3 deletions(-)
>=20
> diff --git a/recipes-networking/openvswitch/openvswitch_git.bb b/recipes-ne=
tworking/openvswitch/openvswitch_git.bb
> index 87790090..c02ef9fd 100644
> --- a/recipes-networking/openvswitch/openvswitch_git.bb
> +++ b/recipes-networking/openvswitch/openvswitch_git.bb
> @@ -20,7 +20,6 @@ FILESEXTRAPATHS:append :=3D "${THISDIR}/${PN}-git:"
> =20
>  SRCREV =3D "0d4c78e153d2b22ab1b173cd4a4dfff89002666d"
>  SRC_URI +=3D "git://github.com/openvswitch/ovs.git;protocol=3Dhttps;branch=
=3Dbranch-3.7 \
> -            file://openvswitch-add-ptest-71d553b995d0bd527d3ab1e9fbaf5a2ae=
34de2f3.patch \
>              file://run-ptest \
>              file://disable_m4_check.patch \
>              file://systemd-update-tool-paths.patch \
> @@ -50,6 +49,60 @@ inherit ptest
>  EXTRA_OEMAKE +=3D "TEST_DEST=3D${D}${PTEST_PATH} TEST_ROOT=3D${PTEST_PATH}"
> =20
>  do_install_ptest() {
> -	echo "disabled: oe_runmake test-install"
> -}
> =20
> +    install -d ${D}${PTEST_PATH}/tests/
> +
> +    install -m 0644 ${B}/tests/atlocal ${B}/tests/atconfig ${D}${PTEST_PAT=
H}/tests/
> +
> +    # Copy test binaries into the ptest directory, preserving subdirectory=
 structure.
> +    # Use -maxdepth 2 because subdirectories like oss-fuzz/ are not enable=
d by default;
> +    # when enabled, their binaries (e.g., ./oss-fuzz/oss) need to be copie=
d as well.
> +    cd ${B}/tests && find . -maxdepth 2 -type f -executable | xargs -I {} =
cp --parents {} ${D}${PTEST_PATH}/tests/
> +    cd ${S}/tests && find . -maxdepth 1 -name '*.at' | xargs -I {} cp --pa=
rents {} ${D}${PTEST_PATH}/tests/
> +    cd ${S}/tests && find . -maxdepth 1 -type f -executable | xargs -I {} =
cp --parents {} ${D}${PTEST_PATH}/tests/
> +
> +    cd ${S}/tests && find . -maxdepth 1 -name '*.py' -exec install -m 0755=
 {} ${D}${PTEST_PATH}/tests/ \;
> +
> +    install -D -m 0644 ${S}/vswitchd/vswitch.ovsschema ${D}${PTEST_PATH}/v=
switchd/vswitch.ovsschema
> +
> +    install -D -m 0755 ${S}/utilities/checkpatch.py ${D}${PTEST_PATH}/util=
ities/checkpatch.py
> +    install -D -m 0644 ${S}/utilities/ovs-pcap.in ${D}${PTEST_PATH}/utilit=
ies/ovs-pcap.in
> +    install -D -m 0644 ${S}/utilities/ovs-pki.in  ${D}${PTEST_PATH}/utilit=
ies/ovs-pki.in
> +
> +    install -D -m 0644 ${S}/python/test_requirements.txt ${D}${PTEST_PATH}=
/python/test_requirements.txt
> +    install -m 0644 ${S}/tests/idltest.ovsschema ${D}${PTEST_PATH}/tests/
> +    install -m 0644 ${S}/tests/idltest2.ovsschema ${D}${PTEST_PATH}/tests/
> +    install -m 0644 ${S}/AUTHORS.rst ${D}${PTEST_PATH}/
> +    install -D -m 0644 ${S}/build-aux/check-structs ${D}${PTEST_PATH}/buil=
d-aux/check-structs
> +
> +    # Symlink vtep.ovsschema to the path expected by ptest; the actual fil=
e is
> +    # already installed by the main openvswitch package.
> +    install -d ${D}${PTEST_PATH}/vtep
> +    ln -sf /usr/share/openvswitch/vtep.ovsschema ${D}${PTEST_PATH}/vtep/vt=
ep.ovsschema
> +
> +    sed  -i \
> +         -e 's|PYTHON=3D.*|PYTHON=3D"python3"|' \
> +         -e 's|PYTHONPATH=3D.*|PYTHONPATH=3D/usr/share/openvswitch/python:=
${PTEST_PATH}/tests:$PYTHONPATH|' \
> +         -e 's|EGREP=3D.*|EGREP=3D'"'"'grep -E'"'"'|g' \
> +         -e 's|CFLAGS=3D.*|CFLAGS=3D'"'"' '"'"'|g' \
> +         ${D}${PTEST_PATH}/tests/atlocal
> +
> +    sed -i \
> +        -e "s|^at_testdir=3D.*|at_testdir=3D'${PTEST_PATH}'|" \
> +        -e "s|^abs_builddir=3D.*|abs_builddir=3D'${PTEST_PATH}'|" \
> +        -e "s|^at_srcdir=3D.*|at_srcdir=3D'${PTEST_PATH}/tests'|" \
> +        -e "s|^abs_srcdir=3D.*|abs_srcdir=3D'${PTEST_PATH}/tests'|" \
> +        -e "s|^at_top_srcdir=3D.*|at_top_srcdir=3D'${PTEST_PATH}'|" \
> +        -e "s|^abs_top_srcdir=3D.*|abs_top_srcdir=3D'${PTEST_PATH}'|" \
> +        -e "s|^at_top_build_prefix=3D.*|at_top_build_prefix=3D'${PTEST_PAT=
H}'|" \
> +        -e "s|^abs_top_builddir=3D.*|abs_top_builddir=3D'${PTEST_PATH}'|" \
> +         ${D}${PTEST_PATH}/tests/atconfig
> +
> +    sed -i \
> +        -e "s|ovs-appctl-bashcomp\.bash|/etc/bash_completion.d/ovs-appctl-=
bashcomp\.bash|g" \
> +        -e "s|ovs-vsctl-bashcomp\.bash|/etc/bash_completion.d/ovs-vsctl-ba=
shcomp\.bash|g"   \
> +        -e "s|^\(.*config\.log.*\)|#\1|g" \
> +         ${D}${PTEST_PATH}/tests/testsuite
> +}
> +RDEPENDS:${PN}-ptest +=3D " ${PN}-testcontroller"
> +RDEPENDS:${PN}-ptest +=3D "python3-packaging python3-setuptools"

