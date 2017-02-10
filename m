Return-Path: <asselsm@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6119BE00546; Fri, 10 Feb 2017 07:33:46 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.4 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, RCVD_IN_DNSWL_NONE,
	RCVD_IN_SORBS_SPAM autolearn=no version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.161.173 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.5 RCVD_IN_SORBS_SPAM RBL: SORBS: sender is a spam source
	*      [209.85.161.173 listed in dnsbl.sorbs.net]
Received: from mail-yw0-f173.google.com (mail-yw0-f173.google.com
	[209.85.161.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 70527E004D8
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:33:43 -0800 (PST)
Received: by mail-yw0-f173.google.com with SMTP id w75so22997664ywg.1
	for <meta-virtualization@yoctoproject.org>;
	Fri, 10 Feb 2017 07:33:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:reply-to:sender:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=16jOSpOlfDVi5Dmec8Y3p8172O03Q1QBAm0wZhK/EPQ=;
	b=o3K8AB5qMvds6k+bGzlEAcftGOAeXLTTBttmx35EOY8PyVesawFGCwkFnJGE9zG/EW
	pMh4ZgqN3aABPW2Ra70gjL1ZupLiKysA/QzGn7hldd5uB/kCP8yRgmyUN5zE6F565gkW
	6o9TpkCAiiTnRXHvvvqxQcjt+nqVUVtMzY7dZCCAQ+qKVjqfcAW7APUybfjNcQBjA6nP
	NxZt+BREwn/QGjuQjdeGFmuyz0dUZNmB3aP5i+sx2ggS7XBzGI6HjzSx3zVNBBynFzqz
	BF+R85oqjhIgr45lACiQHDv43OdKJsMNhwumQN8kVgUKd2HENgMOWn4PIZ9Qi2viFpfd
	jj/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:reply-to:sender:in-reply-to
	:references:from:date:message-id:subject:to:cc;
	bh=16jOSpOlfDVi5Dmec8Y3p8172O03Q1QBAm0wZhK/EPQ=;
	b=Dpby1gfl9GyS8aXWXJla3fuhY2KtOq5u7eUK3Gkpe4odf5mf7XyXV7Ous/45flZ1nf
	Z/FMqm9ocZ2K/n2+O6zATr5QGbAFBqyxaqpLPv0bSYSGOhMxlNPwTXG67Q9S2C7UPOT2
	4820zdRgYiiScMvGsLf+zX62/Y2Lpc94UI5fAguTEcI8XtMg1IZBiwzaCoK3birBbl5r
	el4B34q5Ih1lH8MxklmqVKOqmK71SY2gs2vAUFEVnRCK57aHemhUdMbl9G3hZEbD+2yI
	liAvhtTkkJhQyInC73z2LpQ9FVDezZoBe32T7AstmJQtvg89uv03bTfSjuFHDMyWQaqo
	7GEg==
X-Gm-Message-State: AMke39mVX5FCq/6CAsHBO8m1g0Nlgbo6TW56XxT5gvehjJi7iBnwPxybQtNdU6XaojMT1jYuls4pHuaO122pWQ==
X-Received: by 10.129.84.66 with SMTP id i63mr6827280ywb.306.1486740822239;
	Fri, 10 Feb 2017 07:33:42 -0800 (PST)
MIME-Version: 1.0
Sender: asselsm@gmail.com
Received: by 10.37.21.66 with HTTP; Fri, 10 Feb 2017 07:33:41 -0800 (PST)
In-Reply-To: <BN6PR05MB285170FF48A047358E55626B9E440@BN6PR05MB2851.namprd05.prod.outlook.com>
References: <BN6PR05MB285170FF48A047358E55626B9E440@BN6PR05MB2851.namprd05.prod.outlook.com>
From: Mark Asselstine <mark.asselstine@windriver.com>
Date: Fri, 10 Feb 2017 10:33:41 -0500
X-Google-Sender-Auth: KvATiUNiHLorDS-NHSkbVQv8X0M
Message-ID: <CAPuovEJ7QnXSVFgDDL3kzPs8PXgAcVKH-OXteWEH+KXuj=7Nvg@mail.gmail.com>
To: Peter Spierenburg <peter.spierenburg@nautel.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: I am missing some docker dependencies.
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
X-List-Received-Date: Fri, 10 Feb 2017 15:33:47 -0000
X-Groupsio-MsgNum: 2432
Content-Type: multipart/mixed; boundary=001a114d8db895a3e605482ed226

--001a114d8db895a3e605482ed226
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 9, 2017 at 8:34 PM, Peter Spierenburg
<peter.spierenburg@nautel.com> wrote:
> I think my kernel is missing some modules or features needed by docker. I'm
> posting this here in the hope that someone might have some insight.


Yes, running Docker requires additional configs, as you suspect.
meta-virtualization will get you all the required recipes but not
necessarily all the configuration required to run docker. Those are
usually found in higher order layers such as meta-overc and
meta-cloud-services. We have talked about making a docker, using
something like a (sub)layer, in meta-virtualization for folks asking
for basically the same thing as you. We haven't had time to do this
yet.

Attached is a layer I created mid-2016 which should get you going. I
haven't used it in months so no guaranties but it should avoid you
having to start from scratch.

Mark



>
> root@qemuarm:~# docker daemon
> INFO[0001] API listen on /var/run/docker.sock
> ERRO[0001] Failed to built-in GetDriver graph btrfs /var/lib/docker
> ERRO[0001] Failed to built-in GetDriver graph devicemapper /var/lib/docker
> ERRO[0001] 'overlay' not found as a supported filesystem on this host.
> Please ensure kernel is new enough and has overlay support loaded.
> WARN[0001] Running modprobe bridge br_netfilter failed with message:
> modprobe: module br_netfilter not found in modules.dep
> , error: exit status 1
> FATA[0004] Error starting daemon: Error initializing network controller:
> error obtaining controller instance: Failed to create NAT chain: iptables
> failed: iptables --wait -t nat -N DOCKER: iptables v1.6.0: can't initialize
> iptables table `nat': Table does not exist (do you need to insmod?)
> Perhaps iptables or your kernel needs to be upgraded.
>  (exit status 3)
>
>
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization
>

--001a114d8db895a3e605482ed226
Content-Type: application/x-bzip2; name="meta-minimal-docker.tar.bz2"
Content-Disposition: attachment; filename="meta-minimal-docker.tar.bz2"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_iyzz0fk70

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

--001a114d8db895a3e605482ed226--
