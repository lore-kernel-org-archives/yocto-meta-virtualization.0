Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 58EC3E00C90; Fri, 18 Mar 2016 14:18:35 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.213.67 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 83481E00C89
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 14:18:32 -0700 (PDT)
Received: by mail-vk0-f67.google.com with SMTP id q138so5316149vkb.0
	for <meta-virtualization@yoctoproject.org>;
	Fri, 18 Mar 2016 14:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:reply-to:sender:in-reply-to:references:date:message-id
	:subject:from:to;
	bh=a59NUn2wfA2guqMoDnfU81K4IWoi1Ij1Ua1G0Rm3vZo=;
	b=Ie/MGYSjnOcBvDQXJhWzfxzJAQYQIpH06lfUnvO7JnHtCxbif7BsuR4xEOZ3IcXohB
	wL1GCyMDVlWXi35w83IeKShJgyiRPdIvq6vZa2PhrhGMTg/Gjc08kJUrVWovY2rqyyvN
	Yb69ppdJ0YMRQAx636Di5CuYeLVShygaSskyKdLfvfp+00HswmX/0GMTGontjTEFRPbS
	CqKOn76VjvtUrfmwZO5IOoDpbwtSWft4optFrpgHV/Vb/B1I7gry9r8O5Tk8GPsHq+Kg
	QoJQRckePAlxGpP3ErNRJQQWTM9TWLu957OHI5y6yOCNjSt90Rl6scaSi1NfAf6VzzaM
	0EwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:date:message-id:subject:from:to;
	bh=a59NUn2wfA2guqMoDnfU81K4IWoi1Ij1Ua1G0Rm3vZo=;
	b=SH8fv3aoJA1DokQSzAd4RmN7kbMTduErFl1PQK9wpUg9QkIfu8WiuUSWS/opcRJh5c
	Xt5oThWSO4rud8mOzsSad4MaeiAtDn9OzPmll50kANuqfhv2NM9AaMyILspLIfWKnX2w
	E//BI7m99y4Al0OxYNPulX7AmpyG/8Fczj7aBFfjaT6tSr+nqHATjObSc0v/PYPEyh8l
	7pnmSTq8eIGar0v+dEYf4q2Pv0Er9CaSpMS3rb3O2O41Wm0qX23y3xLkzyddRNt29erx
	cHi88N7DhBB5x6anQQf33j+K48l02dhtyk72wmFR1suqbQv+QWKYfSZFnv5TF4P2zyz+
	pbKA==
X-Gm-Message-State: AD7BkJIN8/n4UB5miojCHZUbIxYOT5u0LC+FwRB62N4vsJ7SWHpxBNbbEFaY6nkCB6pOIZJxao063h4ZyQOJeQ==
MIME-Version: 1.0
X-Received: by 10.31.9.200 with SMTP id 191mr9934vkj.42.1458335912185; Fri, 18
	Mar 2016 14:18:32 -0700 (PDT)
Sender: asselsm@gmail.com
Received: by 10.159.35.198 with HTTP; Fri, 18 Mar 2016 14:18:32 -0700 (PDT)
In-Reply-To: <1458334211-26727-3-git-send-email-mark.asselstine@windriver.com>
References: <1458334211-26727-1-git-send-email-mark.asselstine@windriver.com>
	<1458334211-26727-3-git-send-email-mark.asselstine@windriver.com>
Date: Fri, 18 Mar 2016 17:18:32 -0400
X-Google-Sender-Auth: oyYLKINMZt3NuUJ7mOPZXsCXo-M
Message-ID: <CAPuovEJB2p1P1bmxBEjcN7e7wphHQS1A=Me1rvR8VwrVnk2Xvg@mail.gmail.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, 
	Bruce Ashfield <bruce.ashfield@windriver.com>
Subject: Re: [m-c-s][PATCH 3/3] python: satisfy setup.py 'setup_requires'
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
X-List-Received-Date: Fri, 18 Mar 2016 21:18:35 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Mar 18, 2016 at 4:50 PM, Mark Asselstine
<mark.asselstine@windriver.com> wrote:
> Python setuptools will attempt to satisfy the packages defined as
> 'setup_requires' in setup.py by first looking for the package
> availability locally and ultimately by downloading it from PyPI. This
> is actually a huge security hole and packages should move to using pip
> instead, but this is another story that the upstream packages have to
> address. This also disregards BB_NO_NETWORK and may prove to introduce
> host contamination.
>
> The best approach is to ensure we have the -native version of the
> 'setup_requires' packages present such that setup.py will not attempt
> to complete the download from PyPI.
>
> Make 'pbr' -native available and for packages which we have identified
> as having 'setup_requires' include 'pbr' add the necessary
> python-pbr-native DEPENDS.
>
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---

Bruce,

I have to make python-pbr-native DEPEND on python, so don't push this
one, I will get you an update with the needed change.


Mark


>  meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb     | 5 +++++
>  meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb   | 5 +++++
>  meta-openstack/recipes-devtools/python/python-glanceclient_git.bb | 5 +++++
>  meta-openstack/recipes-devtools/python/python-heat_git.bb         | 5 +++++
>  meta-openstack/recipes-devtools/python/python-heatclient_git.bb   | 5 +++++
>  .../recipes-devtools/python/python-keystoneclient_git.bb          | 5 +++++
>  meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb  | 5 +++++
>  meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb       | 5 +++++
>  meta-openstack/recipes-devtools/python/python-oslo.config_git.bb  | 5 +++++
>  meta-openstack/recipes-devtools/python/python-oslo.context_git.bb | 5 +++++
>  meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb    | 5 +++++
>  meta-openstack/recipes-devtools/python/python-oslo.log_git.bb     | 5 +++++
>  .../recipes-devtools/python/python-oslo.serialization_git.bb      | 5 +++++
>  meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb   | 5 +++++
>  meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb        | 4 ++++
>  .../recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb    | 5 +++++
>  meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb  | 5 +++++
>  meta-openstack/recipes-devtools/python/python-swiftclient_git.bb  | 5 +++++
>  .../recipes-devtools/python/python-testscenarios_0.5.0.bb         | 5 +++++
>  meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb  | 8 ++++++--
>  meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb       | 5 +++++
>  21 files changed, 105 insertions(+), 2 deletions(-)
>
> diff --git a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
> index c241ab4..2c9341f 100644
> --- a/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-cliff_1.15.0.bb
> @@ -19,6 +19,11 @@ DEPENDS += "\
>      python-pbr \
>      "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
> +
>  RDEPENDS_${PN} += "python-prettytable \
>              python-cmd2 \
>              python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
> index c2b79e4..ac40e9d 100644
> --- a/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-fixtures_1.3.1.bb
> @@ -25,6 +25,11 @@ DEPENDS += " \
>         python-pbr \
>         "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += "python-testtools \
>         python-pbr \
>         "
> diff --git a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> index f9edf6d..22dc854 100644
> --- a/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-glanceclient_git.bb
> @@ -24,6 +24,11 @@ inherit setuptools monitor rmargparse
>
>  FILES_${PN} += "${datadir}/${SRCNAME}"
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
> +
>  RDEPENDS_${PN} = "gmp \
>     python-warlock \
>     python-pyopenssl \
> diff --git a/meta-openstack/recipes-devtools/python/python-heat_git.bb b/meta-openstack/recipes-devtools/python/python-heat_git.bb
> index c2b2da7..e5c9b09 100644
> --- a/meta-openstack/recipes-devtools/python/python-heat_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heat_git.bb
> @@ -167,6 +167,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>          python-heatclient \
>          python-sqlalchemy \
> diff --git a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> index 10428c2..26d86be 100644
> --- a/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-heatclient_git.bb
> @@ -9,6 +9,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} +="python-cliff \
>         python-httplib2 \
>         python-iso8601 \
> diff --git a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> index 495f1e3..0b67e40 100644
> --- a/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-keystoneclient_git.bb
> @@ -25,6 +25,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>         python-iso8601 \
>         python-prettytable \
> diff --git a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
> index 5ae891b..9ba93df 100644
> --- a/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
> +++ b/meta-openstack/recipes-devtools/python/python-lockfile_0.10.2.bb
> @@ -19,6 +19,11 @@ DEPENDS += "\
>      python-pbr \
>      "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
> +
>  RDEPENDS_${PN} += "\
>      python-pbr \
>      "
> diff --git a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> index 6d58573..7eb948e 100644
> --- a/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-mox3_0.9.0.bb
> @@ -20,6 +20,11 @@ DEPENDS += "\
>      python-pbr \
>      "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
> +
>  RDEPENDS_${PN} += " \
>      python-pbr \
>      python-fixtures \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> index abd3269..9eaec3c 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.config_git.bb
> @@ -19,6 +19,11 @@ DEPENDS += " \
>          python-pip \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>      python-pbr \
>      python-netaddr \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
> index 3543cae..28285ad 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.context_git.bb
> @@ -19,6 +19,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          bash \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> index 84aab41..55d6317 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.i18n_git.bb
> @@ -21,6 +21,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          python-babel \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
> index d4f7fe0..b290863 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.log_git.bb
> @@ -19,6 +19,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          bash \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> index 32b1cc3..1bf11f4 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.serialization_git.bb
> @@ -20,6 +20,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
> index a833f6c..3bacd7c 100644
> --- a/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-oslo.utils_git.bb
> @@ -20,6 +20,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
> index fdf80b3..2018a1b 100644
> --- a/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
> +++ b/meta-openstack/recipes-devtools/python/python-pbr_1.8.1.bb
> @@ -21,6 +21,10 @@ DEPENDS += " \
>          python-pip \
>          "
>
> +DEPENDS_class-native += ""
> +
>  # RDEPENDS_default:
>  RDEPENDS_${PN} += " \
>          "
> +
> +BBCLASSEXTEND = "native"
> diff --git a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
> index 32ecdb3..5c3636e 100644
> --- a/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
> +++ b/meta-openstack/recipes-devtools/python/python-sqlalchemy-migrate_0.9.7.bb
> @@ -20,6 +20,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += "python-sqlalchemy  \
>         python-decorator \
>         python-tempita  \
> diff --git a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
> index bdacb14..0029c2a 100644
> --- a/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-stevedore_1.9.0.bb
> @@ -20,6 +20,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>          python-pbr \
>          python-argparse \
> diff --git a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> index 1c506a8..5f423c4 100644
> --- a/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> +++ b/meta-openstack/recipes-devtools/python/python-swiftclient_git.bb
> @@ -24,6 +24,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += " \
>          python-simplejson \
>          python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> index 994b6b5..a777b31 100644
> --- a/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testscenarios_0.5.0.bb
> @@ -20,6 +20,11 @@ DEPENDS += "\
>      python-pbr \
>      "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
> +
>  RDEPENDS_${PN} += "\
>      python-testtools \
>      python-pbr \
> diff --git a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> index fe03a5f..3138aae 100644
> --- a/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-testtools_1.8.0.bb
> @@ -16,10 +16,14 @@ SRC_URI[sha256sum] = "8afd6400fb4e75adb0b29bd09695ecb2024cd7befab4677a58c147701a
>  S = "${WORKDIR}/${SRCNAME}-${PV}"
>
>  inherit setuptools
> -
>  DEPENDS += " \
>      python-pbr \
> -"
> +    "
> +
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +    python-pbr-native \
> +    "
>
>  RDEPENDS_${PN} += "\
>      python-extras \
> diff --git a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
> index 523c3df..db89474 100644
> --- a/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
> +++ b/meta-openstack/recipes-devtools/python/python-wsme_0.7.0.bb
> @@ -20,6 +20,11 @@ DEPENDS += " \
>          python-pbr \
>          "
>
> +# Satisfy setup.py 'setup_requires'
> +DEPENDS += " \
> +        python-pbr-native \
> +        "
> +
>  RDEPENDS_${PN} += "\
>          python-pbr \
>          "
> --
> 2.1.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization

