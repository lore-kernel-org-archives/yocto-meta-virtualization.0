Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7BF26E00950; Tue, 16 Oct 2018 07:27:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [209.85.167.65 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bruce.ashfield[at]gmail.com)
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-lf1-f65.google.com (mail-lf1-f65.google.com
	[209.85.167.65])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 225A5E006AF
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Oct 2018 07:27:53 -0700 (PDT)
Received: by mail-lf1-f65.google.com with SMTP id x24-v6so1355426lfe.5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 16 Oct 2018 07:27:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eptczYatjdicUZH5fuIwIweMCOL2u7Q/FKoCjX8a1mE=;
	b=ax0fdqPqyemzWQysHXMkPhbKVyU2fty9E3ZiRsWo2GcVcsTJdKKXHqjJIRslQXOe3Q
	2e943iZv/QmpDYn570WShHtwBrB8hr34c4ZzuM2QkvHtJARNukvWUST04jw3mweqf+ES
	ELQwTWpDiCoIf8zZ96Sd9Flamr6rjfxrX2QftEAD2zrTKD5ikBDJTZkiVISDzimgcvJz
	1+zw+ez16X0AUmNb8WCLWm1/gtsjlreZm2ZGK4YjsoNCrpHhzr5BTaiNo9jtIVTYcIvJ
	hkZsLKeE2FQf2L3n93xEgsAdEotOIiFp05TnDfJAZNYQyfTq5dI4pGQB7YkCv82CHJwI
	u26Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eptczYatjdicUZH5fuIwIweMCOL2u7Q/FKoCjX8a1mE=;
	b=fl/HE0lXPfmQjNjGMGB6jVQOU7ryNdKcxRMEMxc12OFy9tNabZAq2I4fMKzZXSehpM
	Sasfr+C7fZT9qhxiWYskPY4Zhcp4SVUl2haN5gLYDtw4SCNj2pb6GU8E5IAqW+q71YAo
	Pl6GSOcQkqmtuLO++QC7V6WlW9vJghFibWpxYQmtmGbj9YFdHoFZ23LywkHMqQpxdhpS
	rbHKLT5m3k2gb+mzQmqJRlpGZLOyb9E1KBSxZn/s3L/+4g6A3EJX/DnxGXyJuA3LW2qD
	y6rSYlIXvLCMxIDZk1k8w7sXGRYTKsctqD/TkaFsaXEULEFvIc5d5EDkxvqcoBQc2+go
	Ge5w==
X-Gm-Message-State: ABuFfojWPwyf7xW14mMXncNXuTjKqWFh103nawQ8SS6JHS0Oc01HKPOD
	jYFRqeXdELB9ljktwhzFys3Jf5IpqhtOnOqDi2Fl3A==
X-Google-Smtp-Source: ACcGV60WHrCx5PobWIsQoyx3sv2BfVRQGbgQEB8XiZ6jYQkO7ZAsSMdT0jiMO2pMLrhiVux7Q17M27h+aATmL2obTcI=
X-Received: by 2002:a19:d824:: with SMTP id
	p36-v6mr12563938lfg.23.1539700072676; 
	Tue, 16 Oct 2018 07:27:52 -0700 (PDT)
MIME-Version: 1.0
References: <20181012165625.23124-1-okaya@kernel.org>
	<CADkTA4Ozm6yAW1KgS3-StuzSBj0_R5w9MS4zeOxDUGV2O6kj4Q@mail.gmail.com>
	<57a6e60b-6984-1227-0685-33485014f5db@kernel.org>
In-Reply-To: <57a6e60b-6984-1227-0685-33485014f5db@kernel.org>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 16 Oct 2018 10:27:40 -0400
Message-ID: <CADkTA4PF9zRhO8PxZu4nDmeJozDmju6fQoL8LAVQ6QW0CzCNHw@mail.gmail.com>
To: okaya@kernel.org
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [sumo] [PATCH v1] lxc: make error report compatible with ptest
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
X-List-Received-Date: Tue, 16 Oct 2018 14:27:54 -0000
Content-Type: text/plain; charset="UTF-8"

Thanks. This is now in master and sumo.

Bruce
On Fri, Oct 12, 2018 at 3:31 PM Sinan Kaya <okaya@kernel.org> wrote:
>
> On 10/12/2018 3:21 PM, Bruce Ashfield wrote:
> > This is something that should go into master, not the -stable branches.
> >
> > We could do a backport if really required, but it does need to merge
> > to master first.
> >
> > I assume it does also apply to master, but I'd like to hear your confirmation.
> >
>
> Yes, it applies to both. I tested it.
>
> > Bruce
>


-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

