Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id DD1B5E00B1B; Fri,  8 Sep 2017 11:17:52 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.194 listed in list.dnswl.org]
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.194 listed in dnsbl.sorbs.net]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yw0-f194.google.com (mail-yw0-f194.google.com
	[209.85.161.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83C9FE00CCE
	for <meta-virtualization@yoctoproject.org>;
	Fri,  8 Sep 2017 11:17:51 -0700 (PDT)
Received: by mail-yw0-f194.google.com with SMTP id s128so1690923yws.2
	for <meta-virtualization@yoctoproject.org>;
	Fri, 08 Sep 2017 11:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Q9l+FLdN6jPez3CmfAHudTG7DMqm7G/mM6Zvsmnurm0=;
	b=VzEyQy9T2gtwgpRYpF4bo2SNeA/i64lEhxIxENG8OG2amSSRaSqUmEMJSMEufZ3QBU
	xj+fXzWAI7kaKrxqeADue0djYGb+5vTF7s85sG5qMTwwKW5bx3MqsBaepxkW4YbajDgS
	Do8MjIs44Nymabh08QM+eUk/OsyW9lVFtwywVlOH4us6t8DuZevfayX3fNaB4M/+p3KU
	8VVUWFM/qNFbTgadyeXmeUtATBo8yuVNtblXZJ3+Sne9ZBqnxhT+W2gUmwwKow+rvTYs
	0UAjvoUFCIvbybdnRhCp8glB1ReA6qwciLcr6BDeJnK2UY1Z9mqla4fYNs4bRZOgfN/D
	ESkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=Q9l+FLdN6jPez3CmfAHudTG7DMqm7G/mM6Zvsmnurm0=;
	b=onv8/B8x2UtjkNeONlEf2+sv6Xml9+SSzVbMV7KRxVDpREZVNek2iZX9Sd2g8C4eTh
	mN+LCHYT/UXLAP/EQD9++5XGCTT2fPNZ+sxA7yS4dBgtDrLeUfx4vBx4CGF+YvJOKehc
	+wDZ0x7ksKzwg1fza60G/houB2lci43RkrRXcvWkv/f73UWMrgszht2qjlJt1pxY6bx3
	s/zX67fT4O0ADg0vqbXaohFDWeLTmaoZe8eBt0czJ6HKDb+/RAfmN9sp44OSuJabpi6R
	8t3dYLtYpIEI0ro2qogg2RJELrtc2xX93/3WFR+aKhGvH/lYup5yv0eltfKk31jYIhfW
	X9rA==
X-Gm-Message-State: AHPjjUjIB/MZ6nQWKxlQgh62ZaP0EZZMOvpsu1Laj/vuU4qnPUETjWXf
	DiJ2Iok1vjno9re2k36+VhqWklSNlQ==
X-Google-Smtp-Source: ADKCNb5bJjGYHzDuzVhZ7N2gzVB9CKCI5wBWqgleHWrMvrv9Vt7ft5gnYOSpcRGLPmcYgvuv/tnwuGKKKVCOVqvPLjo=
X-Received: by 10.13.219.138 with SMTP id d132mr3310193ywe.204.1504894670462; 
	Fri, 08 Sep 2017 11:17:50 -0700 (PDT)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.162.73 with HTTP; Fri, 8 Sep 2017 11:17:49 -0700 (PDT)
In-Reply-To: <CADkTA4OZtPHTTCY_WH0sioHcPEe=6_=WEJj9YCvugtdJcx4sLQ@mail.gmail.com>
References: <1504079755-13075-1-git-send-email-jianchuan.wang@windriver.com>
	<CADkTA4OZtPHTTCY_WH0sioHcPEe=6_=WEJj9YCvugtdJcx4sLQ@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 8 Sep 2017 14:17:49 -0400
X-Google-Sender-Auth: gkoA4LtUA7DkYSJS0SX4NYaeUlo
Message-ID: <CAPuovE+1JDWEFLE2cegQ3DZq67ViPJdQp5Tv4jP-FytBG7tSyA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH] criu: Correct the installation directory for python modules
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
Reply-To: mark.asselstine@windriver.com
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 08 Sep 2017 18:17:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Aug 31, 2017 at 3:24 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> merged


Bruce,

Can you please revert this change? This will cause a patch failure for
the criu package as there is already a change which addresses this
issue (see commit d3c6004e92bf21f7f2b425d062b6276ff53c8c18 -- criu:
force python to install in ${libdir}).

Unfortunately Jianchuan's commit log for the commit and the patch
itself provide no information on what is being fixed. The obvious
patch conflict leads me to believe this was not actually tested with
the existing fix.

Thanks,
Mark


>
> Bruce
>
> On Wed, Aug 30, 2017 at 3:55 AM, <jianchuan.wang@windriver.com> wrote:
>>
>> From: Jianchuan Wang <jianchuan.wang@windriver.com>
>>
>> Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>> ---
>>  recipes-containers/criu/criu_git.bb                |  2 ++
>>  ...t-the-installation-directory-for-python-m.patch | 29
>> ++++++++++++++++++++++
>>  2 files changed, 31 insertions(+)
>>  create mode 100644
>> recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
>>
>> diff --git a/recipes-containers/criu/criu_git.bb
>> b/recipes-containers/criu/criu_git.bb
>> index 849a832..2df203e 100644
>> --- a/recipes-containers/criu/criu_git.bb
>> +++ b/recipes-containers/criu/criu_git.bb
>> @@ -21,6 +21,7 @@ SRC_URI = "git://github.com/xemul/criu.git;protocol=git
>> \
>>             file://0001-criu-Fix-toolchain-hardcode.patch \
>>             file://0002-criu-Skip-documentation-install.patch \
>>             file://0001-criu-Change-libraries-install-directory.patch \
>> +
>> file://0001-criu-Correct-the-installation-directory-for-python-m.patch \
>>             ${@bb.utils.contains('PACKAGECONFIG', 'selinux', '',
>> 'file://disable-selinux.patch', d)} \
>>
>> file://lib-Makefile-overwrite-install-lib-to-allow-multiarc.patch \
>>            "
>> @@ -43,6 +44,7 @@ EXTRA_OEMAKE_aarch64 += "ARCH=arm64 WERROR=0"
>>
>>  EXTRA_OEMAKE_append += "SBINDIR=${sbindir} LIBDIR=${libdir}
>> INCLUDEDIR=${includedir} PIEGEN=no"
>>  EXTRA_OEMAKE_append += "LOGROTATEDIR=${sysconfdir}
>> SYSTEMDUNITDIR=${systemd_unitdir}"
>> +EXTRA_OEMAKE_append +=
>> "PYTHON_SITEPACKAGES_DIR=${PYTHON_SITEPACKAGES_DIR}"
>>
>>  CFLAGS += "-D__USE_GNU -D_GNU_SOURCE "
>>
>> diff --git
>> a/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
>> b/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
>> new file mode 100644
>> index 0000000..0439b3c
>> --- /dev/null
>> +++
>> b/recipes-containers/criu/files/0001-criu-Correct-the-installation-directory-for-python-m.patch
>> @@ -0,0 +1,29 @@
>> +From 29865b7e9288a60aca151df323ee89c0952e8158 Mon Sep 17 00:00:00 2001
>> +From: Jianchuan Wang <jianchuan.wang@windriver.com>
>> +Date: Thu, 3 Nov 2016 01:33:57 -0400
>> +Subject: [PATCH] criu: Correct the installation directory for python
>> module
>> + distributions
>> +
>> +Signed-off-by: Jianchuan Wang <jianchuan.wang@windriver.com>
>> +---
>> + lib/Makefile | 4 ++--
>> + 1 file changed, 2 insertions(+), 2 deletions(-)
>> +
>> +diff --git a/lib/Makefile b/lib/Makefile
>> +index f1c0821..c3003a5 100644
>> +--- a/lib/Makefile
>> ++++ b/lib/Makefile
>> +@@ -55,8 +55,8 @@ install: lib-c lib-py ../crit/crit c/criu.pc.in
>> +       $(Q) mkdir -p $(DESTDIR)$(LIBDIR)/pkgconfig
>> +       $(Q) sed -e 's,@version@,$(CRIU_VERSION),' -e
>> 's,@libdir@,$(LIBDIR),' -e 's,@includedir@,$(dir $(INCLUDEDIR)),'
>> c/criu.pc.in > c/criu.pc
>> +       $(Q) install -m 644 c/criu.pc $(DESTDIR)$(LIBDIR)/pkgconfig
>> +-      $(E) "  INSTALL " crit
>> +-      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
>> --prefix=$(PREFIX) --record $(CRIT_SETUP_FILES)
>> ++      $(E) "  INSTALL " crit
>> ++      $(Q) python ../scripts/crit-setup.py install --root=$(DESTDIR)
>> --prefix=$(PREFIX) --install-lib=$(PYTHON_SITEPACKAGES_DIR) --record
>> $(CRIT_SETUP_FILES)
>> + .PHONY: install
>> +
>> + uninstall:
>> +--
>> +2.8.1
>> +
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee at
> its end"
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

