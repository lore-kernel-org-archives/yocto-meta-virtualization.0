Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id EBDE4E00DE0; Thu, 18 Jan 2018 07:51:11 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.216.171 listed in list.dnswl.org]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-qt0-f171.google.com (mail-qt0-f171.google.com
	[209.85.216.171])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 60043E00DA8
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:51:10 -0800 (PST)
Received: by mail-qt0-f171.google.com with SMTP id c2so31290768qtn.9
	for <meta-virtualization@yoctoproject.org>;
	Thu, 18 Jan 2018 07:51:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/QnLYFd3NiI/DnnUX/RPvzZIGZsIZ5oHxSAgNxfJUSs=;
	b=u5agWLOLuCnJowxRjgpptOfJLcplCv8XEFtPGVPXkkaFP74qQXazO2xG/Kc9Dnsrxk
	Giv7+EjRaP8HXpBwRU7cMCeoasX47kVMQ3z5J1+gNQwm0J9gWEG8029iU1VIJ+PouAr2
	PdgfTk9POjJzQh2zVli/ovjczTX0Zn6d9erqacb3hS/2C9Ct7uaa276WQqkqQ5eyht4c
	dvVaLxNUTe7ajoRR24qi/7lTPIYrM9myGPgos6Sv3KWAyjTmkS6zNIImW2Qf5+GUEC7E
	KZbgkw2BYG7/gFBF9qi0eC0lWvpFsv2xWLGyhpOnv0iWb4WySQG5BecWeqTaPsYA4x+J
	JtxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/QnLYFd3NiI/DnnUX/RPvzZIGZsIZ5oHxSAgNxfJUSs=;
	b=U0CstWl9atb09pqBnuVWnN22IQZK+X3I+yqdsOiV8aTmMYgd+e5ac26rDyRWlIZcal
	VXlj9MJWYM07r3KnxzSAcDepE102KLzkuV5tcYOKlXUbqXv1+yrjUYDDU1j665r4YMAD
	W8aMB+CaWRJeyNKUsUZTWDNjz0emS9YITjPJYpx0ZdpxDuQDubL8rw/vgzA2KCmjdDJu
	MjdRJGL4HpRZr3HvjLmoqzs6yets2cmoa2AwyBAHiPmBtGm5rCIAEm1X2qGlv2yidqXS
	szmBowvR5PuPeuZjLpIp6u2/KtzUVYDEoYtM4H05fMVvCBK7wF6EMWdr0xpnZ97HXn33
	EXSw==
X-Gm-Message-State: AKwxytefn7RCo67dhMGabNLDc+L0WCw/sOUzdATkEGaRsvXKX9vaZbvJ
	t/IiAq209LfuLt8QQFpaYF6T1zqRleKCAc/Ch3o=
X-Google-Smtp-Source: ACJfBotuXVwkmWv1dR5yupb92oNa61ZW465D/SUC5uVXcnZltxIKkzU2mwFLrBsVjO95c6/fC5+SERDYnQDgVKgWtIU=
X-Received: by 10.200.15.218 with SMTP id f26mr8677782qtk.237.1516290669431;
	Thu, 18 Jan 2018 07:51:09 -0800 (PST)
MIME-Version: 1.0
Received: by 10.12.182.82 with HTTP; Thu, 18 Jan 2018 07:51:08 -0800 (PST)
In-Reply-To: <1516202424-24997-1-git-send-email-mark.asselstine@windriver.com>
References: <1516202424-24997-1-git-send-email-mark.asselstine@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 18 Jan 2018 10:51:08 -0500
Message-ID: <CADkTA4NcgqHMPc4dXDMSkQ4R_+hahi_F7gyvVj+qocDdHswrvQ@mail.gmail.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] python-twisted: drop recipe
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
X-List-Received-Date: Thu, 18 Jan 2018 15:51:12 -0000
Content-Type: text/plain; charset="UTF-8"

merged.

Bruce

On Wed, Jan 17, 2018 at 10:20 AM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Per the original commit this was only included as a temporary measure
> until the recipe was available in meta-openembedded. At this point the
> meta-openembedded recipe is not only available but has been uprev'd
> several times making it more suitable than the recipe we are now
> deleting here.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
>  recipes-devtools/python/python-twisted.inc        | 244 ----------------------
>  recipes-devtools/python/python3-twisted_13.2.0.bb |  67 ------
>  2 files changed, 311 deletions(-)
>  delete mode 100644 recipes-devtools/python/python-twisted.inc
>  delete mode 100644 recipes-devtools/python/python3-twisted_13.2.0.bb
>
> diff --git a/recipes-devtools/python/python-twisted.inc b/recipes-devtools/python/python-twisted.inc
> deleted file mode 100644
> index d734e03..0000000
> --- a/recipes-devtools/python/python-twisted.inc
> +++ /dev/null
> @@ -1,244 +0,0 @@
> -DESCRIPTION = "Twisted is an event-driven networking framework written in Python and licensed under the LGPL. \
> -Twisted supports TCP, UDP, SSL/TLS, multicast, Unix sockets, a large number of protocols                   \
> -(including HTTP, NNTP, IMAP, SSH, IRC, FTP, and others), and much more."
> -HOMEPAGE = "http://www.twistedmatrix.com"
> -
> -#twisted/topfiles/NEWS:655: - Relicensed: Now under the MIT license, rather than LGPL.
> -LICENSE = "MIT"
> -LIC_FILES_CHKSUM = "file://LICENSE;md5=5602d7228daf59a16f0f1b2640c46bca"
> -
> -SRC_URI[md5sum] = "83fe6c0c911cc1602dbffb036be0ba79"
> -SRC_URI[sha256sum] = "095175638c019ac7c0604f4c291724a16ff1acd062e181b01293bf4dcbc62cf3"
> -
> -PYPI_PACKAGE = "Twisted"
> -PYPI_PACKAGE_EXT = "tar.bz2"
> -
> -do_install_append() {
> -    # remove some useless files before packaging
> -    find ${D} \( -name "*.bat" -o -name "*.c" -o -name "*.h" \) -exec rm -f {} \;
> -}
> -
> -PACKAGES += "\
> -    ${PN}-zsh \
> -    ${PN}-test \
> -    ${PN}-protocols \
> -    ${PN}-conch \
> -    ${PN}-lore \
> -    ${PN}-mail \
> -    ${PN}-names \
> -    ${PN}-news \
> -    ${PN}-runner \
> -    ${PN}-web \
> -    ${PN}-words \
> -    ${PN}-flow \
> -    ${PN}-pair \
> -    ${PN}-core \
> -"
> -
> -PACKAGES =+ "\
> -    ${PN}-src \
> -    ${PN}-bin \
> -"
> -
> -RDEPENDS_${PN} = "\
> -    ${PN}-bin \
> -    ${PN}-conch \
> -    ${PN}-lore \
> -    ${PN}-mail \
> -    ${PN}-names \
> -    ${PN}-news \
> -    ${PN}-runner \
> -    ${PN}-web \
> -    ${PN}-words \
> -"
> -
> -RDEPENDS_${PN}-core = "python-core python-zopeinterface python-contextlib"
> -RDEPENDS_${PN}-test = "${PN}"
> -RDEPENDS_${PN}-conch = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-lore = "${PN}-core"
> -RDEPENDS_${PN}-mail = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-names = "${PN}-core"
> -RDEPENDS_${PN}-news = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-runner = "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-web += "${PN}-core ${PN}-protocols"
> -RDEPENDS_${PN}-words += "${PN}-core"
> -RDEPENDS_${PN}-flow += "${PN}-core"
> -RDEPENDS_${PN}-pair += "${PN}-core"
> -RDEPENDS_${PN}-dbg = "${PN}"
> -
> -ALLOW_EMPTY_${PN} = "1"
> -FILES_${PN} = ""
> -
> -FILES_${PN}-test = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/test \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/test \
> -"
> -
> -FILES_${PN}-protocols = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/*.py* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/gps/ \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/mice/ \
> -"
> -
> -FILES_${PN}-zsh = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zsh \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/twisted-completion.zsh \
> -"
> -
> -FILES_${PN}-conch = " \
> -    ${bindir}/ckeygen \
> -    ${bindir}/tkconch \
> -    ${bindir}/conch \
> -    ${bindir}/conchftp \
> -    ${bindir}/cftp \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_conch.py* \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/conch  \
> -"
> -
> -FILES_${PN}-core = " \
> -${bindir}/manhole \
> -${bindir}/mktap \
> -${bindir}/twistd \
> -${bindir}/tap2deb \
> -${bindir}/tap2rpm \
> -${bindir}/tapconvert \
> -${bindir}/tkmktap \
> -${bindir}/trial \
> -${bindir}/easy_install* \
> -${bindir}/pyhtmlizer \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.so \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/notestplugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/testplugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_ftp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_inet.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_manhole.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_portforward.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_socks.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_telnet.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_trial.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/dropin.cache \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/application \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/cred \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/enterprise \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/internet \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/manhole \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/persisted \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols\
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python\
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/timeoutqueue.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/filepath.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dxprofile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/plugin.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/htmlizer.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dispatch.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/hook.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadpool.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/otp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/usage.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/roots.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/versions.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/urlpath.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/util.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/components.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/logfile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/runtime.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/reflect.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/context.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/threadable.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/rebuild.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/failure.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/lockfile.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/formmethod.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/finalize.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/win32.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/dist.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/shortcut.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zipstream.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/release.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/syslog.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/log.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/compat.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/zshcomp.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/procutils.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/text.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/_twisted_zsh_stub \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/scripts/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/spread/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/tap/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/trial/ \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/__init__.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/_version.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/copyright.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/im.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/python/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/*.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/topfiles \
> -${libdir}/${PYTHON_DIR}/site-packages/Twisted*egg-info \
> -"
> -
> -FILES_${PN}-lore = " \
> -${bindir}/bookify \
> -${bindir}/lore \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_lore.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/lore \
> -"
> -
> -FILES_${PN}-mail = " \
> -${bindir}/mailmail \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_mail.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/mail \
> -"
> -
> -FILES_${PN}-names = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_names.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/names \
> -"
> -
> -FILES_${PN}-news = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_news.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/news \
> -"
> -
> -FILES_${PN}-runner = " \
> -${libdir}/site-packages/twisted/runner/portmap.so \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/runner\
> -"
> -
> -FILES_${PN}-web = " \
> -${bindir}/websetroot \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_web.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/web\
> -"
> -
> -FILES_${PN}-words = " \
> -${bindir}/im \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_words.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/words\
> -"
> -
> -FILES_${PN}-flow = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_flow.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/flow \"
> -
> -FILES_${PN}-pair = " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/twisted_pair.py* \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/pair \
> -"
> -
> -FILES_${PN}-dbg += " \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*/.debug \
> -${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/.debug \
> -"
> -
> -RDEPENDS_{PN}-src = "${PN}"
> -FILES_${PN}-src = " \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*.py \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*.py \
> -    ${libdir}/${PYTHON_DIR}/site-packages/twisted/*/*/*.py \
> -"
> diff --git a/recipes-devtools/python/python3-twisted_13.2.0.bb b/recipes-devtools/python/python3-twisted_13.2.0.bb
> deleted file mode 100644
> index 98016cc..0000000
> --- a/recipes-devtools/python/python3-twisted_13.2.0.bb
> +++ /dev/null
> @@ -1,67 +0,0 @@
> -inherit pypi setuptools3
> -require python-twisted.inc
> -
> -RDEPENDS_${PN}-core = "python3-core python3-zopeinterface python3-lang"
> -
> -FILES_${PN}-core_append += " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/__pycache__ \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/python/__pycache__/*pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/__init__*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/notestplugin*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/testplugin*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_ftp*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_inet*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_manhole*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_portforward*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_socks*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_telnet*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_trial*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_core*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_qtstub*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_reactors*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/cred*.pyc \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/dropin*.cache \
> -"
> -
> -FILES_${PN}-names_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_names*.pyc \
> -"
> -
> -FILES_${PN}-news_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_news*.pyc \
> -"
> -
> -FILES_${PN}-protocols_append += " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/protocols/__pycache__/*pyc \
> -"
> -
> -FILES_${PN}-conch_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_conch*.pyc \
> -"
> -
> -FILES_${PN}-lore_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_lore*.pyc \
> -"
> -FILES_${PN}-mail_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_mail*.pyc \
> -"
> -
> -FILES_${PN}-web_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_web*.pyc \
> -"
> -
> -FILES_${PN}-words_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_words*.pyc \
> -"
> -
> -FILES_${PN}-flow_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_flow*.pyc \
> -"
> -
> -FILES_${PN}-pair_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_pair*.pyc \
> -"
> -
> -FILES_${PN}-runner_append = " \
> -  ${libdir}/${PYTHON_DIR}/site-packages/twisted/plugins/__pycache__/twisted_runner*.pyc \
> -"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

