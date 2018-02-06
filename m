Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B12FBE00E5E; Mon,  5 Feb 2018 17:34:34 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.215.45 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f45.google.com (mail-lf0-f45.google.com
	[209.85.215.45])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D6D1DE00A44
	for <meta-virtualization@yoctoproject.org>;
	Mon,  5 Feb 2018 17:34:33 -0800 (PST)
Received: by mail-lf0-f45.google.com with SMTP id 63so384604lfv.4
	for <meta-virtualization@yoctoproject.org>;
	Mon, 05 Feb 2018 17:34:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lRTREt+vPi+eNZQG7QMjqkh7CSknfrkUYh3UzZd8Eh0=;
	b=Pgj/KUa6GGgc/LgNUONrxN7wyIu1cxC36TVJaZ8XRoph8kDQ4S7X5Ob+e1+DEws2o+
	ANWdNG0nHH0CeqwRivFvldotAMENM8BXePe8RYD7h3Lc67qobEKCJoGZKp920iQzZ7vA
	Z6ekHzuggkggMzLK0YcbFHuhdfcsKhA5blZ35sA4VTJO4k3cd6FSg0j+WnPYGdp/v3Oc
	ywhwL/OXsdZ0ImVsK1VEHgugHXNvIXGvETdTxkQGc3aijmFmnKNUeXDhDMeERRfqjfr3
	70r44CmhaCfjMyj+UhTRfMWDI3oKhvw51nVrH+n4urXg78Odv3CU7wNKiO5+QeW875Tp
	xcfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lRTREt+vPi+eNZQG7QMjqkh7CSknfrkUYh3UzZd8Eh0=;
	b=tqTCihKJlNh94NNlKpJNTDD6u00Kv1ATGlodsZsx2yKr8sEmZnThFvzQzrG9RlAPuU
	kf6c9F+JxzK7KPw6tadKyUzVoNnMHi/bAItbTFjFlJihwzi5EY+/esp4px1eKwGFXw2n
	XaXIXRIB5uwCRNjF3eAOeFx9RNERX/jgf6VUvm3Kirn5Hq04AyefDZc5nxtS8cJw7ykY
	YYDJa2drGEljB8FApwNZyqp1G3Dwhgful/G6U3I8pT8ebZ6GYaBevO9aFfSZM8mzWVlk
	ZajyFYLzkLWrdi71cEhjriTvckreqsAQXx7pKC1aSUhnTYSQZBbMqUKyJSuKlsgLzZyA
	eVaw==
X-Gm-Message-State: APf1xPCW4DuW7Y35hknzv+K2vk1fSNOdRO5Y4Znm0AhtddRSfp1m3TZh
	FAN1mD3VpGvMuRN4mf63O1x9LBDnKRU63rx6iK/iiw==
X-Google-Smtp-Source: AH8x227bfdRekklKrN6x3tE6vXMPYU6fZ80KlhZgJLIdY+xjY0ppDgRjcpN5wtWJpEqMrRi66DZ0pYSArmkJN0CgZ9Q=
X-Received: by 10.46.58.8 with SMTP id h8mr419041lja.130.1517880872474; Mon,
	05 Feb 2018 17:34:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.18.151 with HTTP; Mon, 5 Feb 2018 17:34:31 -0800 (PST)
In-Reply-To: <20180205171306.2201-1-psaavedra@igalia.com>
References: <20180205171306.2201-1-psaavedra@igalia.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 5 Feb 2018 20:34:31 -0500
Message-ID: <CADkTA4PmEMe9fR8KaAt3s6QhVJ8MSs8DszKxkPtJRJ0+kamU-w@mail.gmail.com>
To: Pablo Saavedra <psaavedra@igalia.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] Added Yocto recipe for Puppet 4.10.9
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
X-List-Received-Date: Tue, 06 Feb 2018 01:34:34 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Pablo,

Thanks for the submission .. but I do have a few questions.

How does this compare to the other recipes for puppet ? In particular
the one in meta-cloud-services, since I'm familiar with it.

How has this been tested ? We used to use puppet and chef in
meta-cloud-services, so I'd like to log how this has been used as part
of the commit.

Summary: I'm happy to merge this, I just want to document how it
should be used (so I can know if it breaks) and make sure that it is
in the right place (so I can delete any other recipes).

Cheers,

Bruce

On Mon, Feb 5, 2018 at 12:13 PM, Pablo Saavedra <psaavedra@igalia.com> wrote:
> Signed-off-by: Pablo Saavedra <psaavedra@igalia.com>
> ---
>  recipes-support/puppet/puppet_4.10.9.bb | 41 +++++++++++++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 recipes-support/puppet/puppet_4.10.9.bb
>
> diff --git a/recipes-support/puppet/puppet_4.10.9.bb b/recipes-support/puppet/puppet_4.10.9.bb
> new file mode 100644
> index 0000000..a335546
> --- /dev/null
> +++ b/recipes-support/puppet/puppet_4.10.9.bb
> @@ -0,0 +1,41 @@
> +SUMMARY = "Open source Puppet is a configuration management system"
> +HOMEPAGE = "https://puppetlabs.com/puppet/puppet-open-source"
> +LICENSE = "Apache-2.0"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=7c9045ec00cc0d6b6e0e09ee811da4a0"
> +
> +SRC_URI = " \
> +    https://downloads.puppetlabs.com/puppet/puppet-${PV}.tar.gz \
> +    file://add_puppet_gemspec.patch \
> +    file://puppet.conf \
> +"
> +SRC_URI[md5sum] = "8af3c2fec5dc4683d80aab4efc1614c6"
> +SRC_URI[sha256sum] = "e667bd825e54bbc38c30534c25adc441ed638fc484fe0abe278f0335770cd161"
> +
> +inherit ruby
> +
> +DEPENDS += " \
> +        ruby \
> +        facter \
> +        hiera \
> +"
> +
> +RDEPENDS_${PN} += " \
> +        ruby \
> +        facter \
> +        hiera \
> +        ruby-shadow \
> +        bash \
> +"
> +
> +RUBY_INSTALL_GEMS = "puppet-${PV}.gem"
> +
> +do_install_append() {
> +    install -d ${D}${sysconfdir}/puppet
> +    install -d ${D}${sysconfdir}/puppet/manifests
> +    install -d ${D}${sysconfdir}/puppet/modules
> +
> +    install -m 655 ${S}/conf/auth.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/fileserver.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${S}/conf/environment.conf ${D}${sysconfdir}/puppet/
> +    install -m 655 ${WORKDIR}/puppet.conf ${D}${sysconfdir}/puppet/
> +}
> --
> 2.11.0
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

