Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7B92BE00E39; Thu, 29 Aug 2019 21:30:01 -0700 (PDT)
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
	*      [209.85.167.52 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
	[209.85.167.52])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3E5A8E00E32
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:29:43 -0700 (PDT)
Received: by mail-lf1-f52.google.com with SMTP id v16so4233226lfg.11
	for <meta-virtualization@yoctoproject.org>;
	Thu, 29 Aug 2019 21:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=tJxMdjgWupyOog1Iht8dk+V4ZHvSO5bhgNDs2L5YYlA=;
	b=BkbW+p8c8g3U6yhseEgmWk5I0osGz9WCrXMyuTPCkfcQMLUKhihtEEKxK1+akDcqMc
	t7FEYAUDRf3axMHZx2IPOI/lV95SMewnBLbGuUWZvA6sN0vKbGkL63VNUaBRLcUM/Okg
	1ZPsdycrwoCj5asB742pQeoemhAxRb9kfAL70DhQ7N1nTaxMo8m+jBHHm/dtCQrOQLXG
	LcVx4YVAuxQfwvphlar3Dd+4KP51R/rBI8vGMzd3YfI7YkhXUDVcnhxUblHGCJmiX6KM
	3GeaxEpT3ajTTkCwgbdEHCrNEz7NDBzBckPhuEPNSO0/6bLMhR1CWouRPi3lWct5stef
	Zwbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=tJxMdjgWupyOog1Iht8dk+V4ZHvSO5bhgNDs2L5YYlA=;
	b=Nduo4pjeLXE/8gMEMnWLB9WT78m8OzUIqIksYAGzVW5WWMm1EBzGxNadzvrm1C3pxx
	9lHQNOQUeX5uzj+o2lPbw7UbIE6rViUczI62Z13gF1Lres3Ox4gItusqSAwYoiTFI3JF
	mRWxqUJHvhLkd7k425FN9KxuYZF7Lc4nBSSsouzKPZXY3WbAvzaw05uR5+QjgbAjcZbv
	lxb3SRd/WrsiUMKbvMfTYz7NsfpRmmru1A0+fyBw9Q1QzQRXTeNyuPU6SPXx4gTbKan0
	4yB3CKmXgTwqw25tnf0UiEuxR3ek0GHFtF+fK/JsfzOr9dngHeoFTue6PC0qjxQ7Hk5Z
	dmuQ==
X-Gm-Message-State: APjAAAWy/MLLbwDRaD0nBk8R+0CpPF7rS2Oe0dCDEyoqgjqQaIbPPRTA
	HP6fFkP+H1h6OR81wrEIVMTuzbtMD9jvTnfieDw=
X-Google-Smtp-Source: APXvYqxSlzKW3dPfA7BdLNGulqHDiUcb0c7WEX18MZ3Fwm4Pd/e4C+/5h31a31VJ+BRy0c18fAu7dR3bB5NhyqGP0aw=
X-Received: by 2002:a19:428f:: with SMTP id p137mr8405926lfa.149.1567139381951;
	Thu, 29 Aug 2019 21:29:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190829093948.2738-1-Qi.Chen@windriver.com>
In-Reply-To: <20190829093948.2738-1-Qi.Chen@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Aug 2019 00:29:30 -0400
Message-ID: <CADkTA4P4azATb3q0ou=R2O8SEHv0-VGFgNP9GKZttTzjN-5Pew@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] openvswitch: install ovs-systemd-reload
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
X-List-Received-Date: Fri, 30 Aug 2019 04:30:01 -0000
Content-Type: text/plain; charset="UTF-8"

merged

Bruce

On Thu, Aug 29, 2019 at 5:40 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Install ovs-systemd-reload as openvswitch.service uses it.
>
>   openvswitch.service:ExecReload=/usr/share/openvswitch/scripts/ovs-systemd-reload
>
> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  recipes-networking/openvswitch/openvswitch.inc | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/recipes-networking/openvswitch/openvswitch.inc b/recipes-networking/openvswitch/openvswitch.inc
> index 8aab739..46865bd 100644
> --- a/recipes-networking/openvswitch/openvswitch.inc
> +++ b/recipes-networking/openvswitch/openvswitch.inc
> @@ -129,6 +129,9 @@ do_install_append() {
>         install -m 644 ${S}/rhel/usr_lib_systemd_system_ovsdb-server.service \
>                 ${D}/${systemd_unitdir}/system/ovsdb-server.service
>
> +       install -d ${D}/usr/share/openvswitch/scripts/
> +       install -m 755 ${S}/rhel/usr_share_openvswitch_scripts_ovs-systemd-reload ${D}/usr/share/openvswitch/scripts/ovs-systemd-reload
> +
>         oe_runmake modules_install INSTALL_MOD_PATH=${D}
>         install -d ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages
>         cp -r ${S}/python/ovstest/ ${D}${libdir}/python${PYTHON_BASEVERSION}/site-packages/
> --
> 2.17.1
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

