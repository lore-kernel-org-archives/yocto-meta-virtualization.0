Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2D75FE00938; Tue,  3 Apr 2018 20:14:13 -0700 (PDT)
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
	*      [209.85.215.42 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lf0-f42.google.com (mail-lf0-f42.google.com
	[209.85.215.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 88926E008D2
	for <meta-virtualization@yoctoproject.org>;
	Tue,  3 Apr 2018 20:14:12 -0700 (PDT)
Received: by mail-lf0-f42.google.com with SMTP id q5-v6so23106233lff.12
	for <meta-virtualization@yoctoproject.org>;
	Tue, 03 Apr 2018 20:14:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LVY1KSTkUFqMAEl+jzDTwyLnzQ9SFt1PwOKHZrE64uk=;
	b=cofeqwmraIc5LAQtIVzVtQmw3suX7BpbNloQxIT8yecjeS3AgCHkNWQ9jrC4UrPU9s
	BFNZHQuo+Ivn26KSvQN3EgV/kW0ckceAQxfyb6iew1s/7CucihocAgVs7IwNHsxLRiX3
	ZQT4/A87Gbrl7K+FZ1tBs/BPKIxsgdeRuvhBRvZ60N9J0Zbl1mNEewgN+ml11Cx6DdtJ
	oV+4nkdNcg/pGpjCw7sLn1BQZvBlNgjtvrIDDL8PoSrgj+8n7gO+z7FCCXCX5jyUlpz2
	JnMb7Ug/yxz4A1EvjoxKNZ/E6YQCtdun6h3PQH6Du1HbmBNnTjqgk/EEiQTsACmA0hbm
	rP4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LVY1KSTkUFqMAEl+jzDTwyLnzQ9SFt1PwOKHZrE64uk=;
	b=Di8BLY3NiTx+ZhEwbZV7rO3daEzpt1FgEIa3o7g5bKqQm6BeVf8YdAvVxxxKkg/Ep9
	Qgj4N4+CtNy1q7IMJttXN9rpYqI0GK2mqXYd0ZIuGWIoz0yLDHSitWYs0EhdyEg7ysK2
	1EoUX/rG98a/fTZt18sR99nAB96gQG9vj2oIJDhYwrrUjF5C/fz/bID4xRFSLGJluLoW
	/htCxqG3qq34fjKYI1w0cQD3tiM5JhU2RxMR8rS4Nfi8365TNzSRqzHrcTvKoKAnjs8r
	/KUUOH+o0wo8UPTbPDPZL+feqg+PHVC+MLIBd1LMH+riJ4LF7a/jlC/13WAr2gxBZjre
	HTwA==
X-Gm-Message-State: ALQs6tC+LmzXV4hXtLKrW95tPemwzoRMDDJ1eUprK29NpJZA8/5zCoPZ
	NTRrEA2gHtPdEIUvrwLR/nDNWHRpF9CFGTgqf9G4OZT/
X-Google-Smtp-Source: AIpwx4+mKxo52odTYIDvPxCDEyPzASE0HrLko9JhpeAgeJkGQFwC2NxsmnEgw4H9OwIpFj2JV5tftGuzQD7aHj1FMCk=
X-Received: by 2002:a19:1b02:: with SMTP id b2-v6mr9465939lfb.3.1522811651011; 
	Tue, 03 Apr 2018 20:14:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 3 Apr 2018 20:14:10 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 3 Apr 2018 23:14:10 -0400
Message-ID: <CADkTA4OCesBQoAPuUOtBB=kzZ38hwH0HNVY=d68ciBe8Fsrp4A@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: RFT/FYI: docker/containerd/runc uprevs pushed to master
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
X-List-Received-Date: Wed, 04 Apr 2018 03:14:13 -0000
Content-Type: text/plain; charset="UTF-8"

Hi all,

After spending a few days de-tangling the moby/docker/runc/containerd
and oe-core go infrastructure changes, I was able to run
docker/runc/containerd through a system/stress test and everything
seems to be working.

There were a few regressions that I worked through, as well as
build/packaging changes, but I'm no longer seeing any issues and all
the patches/functionality have been carried forward.

One thing of note is that the docker and open containers containerd
split/fork is no longer an issue, so I've modified the default to be
the opencontainers variant. Similarly, the docker and opencontainers
runc are very similar. I've kept both variants of both recipes for
now, since I'd like to track things for a bit longer before declaring
the split unnecessary.

Also for those that care, I created a reference docker-ce recipe that
tracks the docker-ce repo versus the components themselves.  Right now
it is reference only, since it needs a bit more work, but I wanted to
get it out there, in case someone really cares about docker-ce (I
don't really, but someone might!).

Summary: I just pushed the following changes to master:

  d7d310ae4113 meta-virt: prefer containerd-opencontainers
  935e3d969ef1 containerd: uprev to v1.0.2
  f5fbfa8ac4db docker-ce: introduce reference recipe/build
  a5074cecf18f docker: uprev to 18.03.0
  e3d960f4fcd9 runc: uprev to 1.0.0-rc5

If anyone sees regressions, build or architecture issues .. report
them to me (and the list) and we'll get them fixed up.

Cheers,

Bruce

-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

