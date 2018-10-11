Return-Path: <richard.purdie@linuxfoundation.org>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 3E1BFE00A54; Thu, 11 Oct 2018 12:03:57 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [209.85.221.54 listed in list.dnswl.org]
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
	[209.85.221.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B7CDBE00566
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 12:03:56 -0700 (PDT)
Received: by mail-wr1-f54.google.com with SMTP id 61-v6so10870659wrb.6
	for <meta-virtualization@yoctoproject.org>;
	Thu, 11 Oct 2018 12:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=uluRIQbhdpNnLkv1oYs7bXhM2O37/x4pzcF3EvfNBx8=;
	b=hsdZhHyEb3XYYzmmbUghQDJXtVKwMikMXBji0j564VmRh9dluBBcZNpyZ2GOBCvq2J
	3BbJREhb7zOTdlk8aLtScph2JttQoeA5mKmBVQpE7X1Om6/gnYJabjodSeJ1K7xnN306
	3FSOUNin+jIxXkDsPLNjcEp91g5WrEEpcPA7U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=uluRIQbhdpNnLkv1oYs7bXhM2O37/x4pzcF3EvfNBx8=;
	b=WDcoPFMgmAStv4HzycSYTU09Gp0eZMECI2zi5C/9r51G/kKOAi2B0To5ZoQ26y72GC
	9dZiCAbegi0Z3pZXMMzB9gQ+ZLudcE6K9K1OKUdgCeaetNwQoMlX73bNZMjDEDrxyqri
	x+fPssOPmVoecffkheCk2WjjtZ7IWgvG/3bnxYWgcKbvjt6ggFZ3w+F7haTnpGPxzMh4
	OPJWTWrgCAtMgGf0J0K7OXrwLcQSxJ/BitqbS58UTUscuJ9qKi5OF6Z3xf608z4cOXIU
	Y/cmPwMljCiUxuG/IeXmAF3bJYJFS/yWFbv308VDhgB6TVAH9X6olOvtoJ3Sv5JsVYXc
	5SEQ==
X-Gm-Message-State: ABuFfogn/HKOkl+EYRHSV8QWhkjVvW/WQ1lvemVzO0Ixikp1WditLkni
	UuvL3giGAoaHdg8YrTn8ih/pew==
X-Google-Smtp-Source: ACcGV61qihByw+8dB3v/uhofc02NvdFjWBcvgOT9eZFE0pB+iVPMh+chqGOOqZAf0F2wR0p4lC2l+g==
X-Received: by 2002:adf:a481:: with SMTP id
	g1-v6mr2864509wrb.167.1539284635726; 
	Thu, 11 Oct 2018 12:03:55 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	134-v6sm12901498wmb.13.2018.10.11.12.03.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 11 Oct 2018 12:03:54 -0700 (PDT)
Message-ID: <18456af17d6a4f4ba1fdd2cc28cce4493cd517fe.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 11 Oct 2018 20:03:53 +0100
In-Reply-To: <CADkTA4PR5vL_TYkR+dLEd--GGb7Bf=pso9OPz2T3T0NnisOxYA@mail.gmail.com>
References: <20181011185410.28270-1-richard.purdie@linuxfoundation.org>
	<CADkTA4PR5vL_TYkR+dLEd--GGb7Bf=pso9OPz2T3T0NnisOxYA@mail.gmail.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH] ceph: Remove accidentally added patch file
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
X-List-Received-Date: Thu, 11 Oct 2018 19:03:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-10-11 at 14:59 -0400, Bruce Ashfield wrote:
> merged.
> 
> I had git rm'd it locally, but forgot to commit and push the change
> :D

Thanks, its the kind of little bug which was irritating me more than it
should :)

Cheers,

Richard


