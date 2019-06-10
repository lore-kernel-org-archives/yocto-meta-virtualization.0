Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id E7B90E00D35; Mon, 10 Jun 2019 06:55:59 -0700 (PDT)
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
	*      [209.85.167.67 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f67.google.com (mail-lf1-f67.google.com
	[209.85.167.67])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 41B11E00CAA
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2019 06:55:59 -0700 (PDT)
Received: by mail-lf1-f67.google.com with SMTP id y13so6680578lfh.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 10 Jun 2019 06:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=pBeLKhB+qz4w3lG4Mqbn31rcFIzWgh8/SAOh4l9QhZ4=;
	b=s7dVfYHF8OzcLZLUdi0ypqmBDNmn8dopBHdmyFAPinnTqsyGorGn27Uo3F++jesXKJ
	JL9JfbZ075nr3kb3JrygwQDicBeKmo0h/sZiAAGpqJDUVWnI4vgm6ZzHYTHgegLyyVgZ
	BXS0grWqt9DBueau6PcfJqRs4bqPqNV50p0B9XfUkrlR4Vxrh/0FFMy8fb+Eorx5zIZW
	HAKJQP7auIBXKkzYEaxp1wKsnLKsPdiqLLu0XFrEjsDbNNoFxGP/ITjCh6Sfg4tWwVGd
	fqZ0FZAU3mT/7r+6Dp4/v05Ix8qUyYek5C+UWfVTYGbrFeUAJIvRTexC7CvG5Q3FsNM7
	vhmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=pBeLKhB+qz4w3lG4Mqbn31rcFIzWgh8/SAOh4l9QhZ4=;
	b=PL80J52QVG2YvHr70Ire7ESfnCXywtC0b+IlZsDRxc2A5n5PdeH0YP7C1LMEjJm5IT
	7sfEzPvC2f2SkWQLu4oNTMR/iNb8SgUKXS++g27CvE526uVbyzvwHblh62EloaXR0HjV
	kb36Ivd0oJY+/yW8p9Q98Wy1yXBy+b0DGb4Wmb6L/Fba9wbit0IaL0cabklAlCYCe8RQ
	dwqYjQsums7kh8B0bFGgNX2BaoL9v5XPFJn/Qt7zTtufBsJ7yS89Qut7wwIsZ+ngVnHy
	mkNf42H4bQ2mVEGMpdgOSbYYw0QLNWP7L5GLjc4LU9QafPP7zi94b9qiYT8M8ho9pkyE
	A+bg==
X-Gm-Message-State: APjAAAXTkuZ5C1PHk/s7xHxhDNnH0y/tN+g7zBl7vXZh8LFrsfCgW71K
	8NiOFaS7pPDZBMIuOZJsp7p6+C8hKm2hyRVHRBQ=
X-Google-Smtp-Source: APXvYqzbSHZgA5cbfJUGzNEzf71rz5VzqRmqzzqaEyQpqICZPxtlhw81NIVBtzjEf2J5LYaY4cRW7rCJoV6MJVZDvNI=
X-Received: by 2002:ac2:495e:: with SMTP id o30mr35208010lfi.140.1560174957915;
	Mon, 10 Jun 2019 06:55:57 -0700 (PDT)
MIME-Version: 1.0
References: <1559787568-378928-1-git-send-email-changqing.li@windriver.com>
In-Reply-To: <1559787568-378928-1-git-send-email-changqing.li@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Mon, 10 Jun 2019 09:55:46 -0400
Message-ID: <CADkTA4NU3L7hoZstqnfqjfToA0cyiUeoDrJe=VoV5AC=VQ6JEA@mail.gmail.com>
To: changqing.li@windriver.com
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] nagios-nrpe: fix systemd service start failed
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
X-List-Received-Date: Mon, 10 Jun 2019 13:56:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 5, 2019 at 10:20 PM <changqing.li@windriver.com> wrote:
>
> From: Changqing Li <changqing.li@windriver.com>
>
> Jun 06 01:44:51 qemux86 systemd[1]: Started Nagios nrpe plugin.
> Jun 06 01:44:51 qemux86 nrpe[1263]: Starting up daemon
> Jun 06 01:44:51 qemux86 nrpe[1263]: Cannot write to pidfile '/var/nagios/nrpe.pid' - check your privileges.
> Jun 06 01:44:51 qemux86 systemd[1]: nagios-nrpe.service: Main process exited, code=exited, status=2/INVALIDARGUMENT
> Jun 06 01:44:51 qemux86 systemd[1]: nagios-nrpe.service: Failed with result 'exit-code'
>
> In configuration file /etc/nagios/nrpe.cfg, the pidfile is under /var/nagios.
>
> fix by stop rm the /var/nagios, and include it into daemon packages
>
> Signed-off-by: Changqing Li <changqing.li@windriver.com>

Merged.

Bruce

> ---
>  recipes-extended/nagios/nagios-nrpe_3.2.1.bb | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
>
> diff --git a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> index 9493336..3afa5dd 100644
> --- a/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> +++ b/recipes-extended/nagios/nagios-nrpe_3.2.1.bb
> @@ -73,8 +73,6 @@ do_install_append() {
>          install -d ${D}${systemd_unitdir}/system
>          install -m 644 ${WORKDIR}/nagios-nrpe.service ${D}${systemd_unitdir}/system/
>      fi
> -
> -    rmdir -p --ignore-fail-on-non-empty ${D}${localstatedir}/nagios
>  }
>
>  PACKAGES = "${PN}-dbg ${PN}-plugin ${PN}-daemon"
> @@ -86,6 +84,7 @@ FILES_${PN}-plugin = "${NAGIOS_PLUGIN_DIR} \
>  FILES_${PN}-daemon = "${sysconfdir} \
>                        ${bindir} \
>                        ${nonarch_libdir}/tmpfiles.d/ \
> +                      ${localstatedir} \
>  "
>
>  RDEPENDS_${PN}-daemon = "nagios-base"
> --
> 2.7.4
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

