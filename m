Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 15631E0077E; Mon, 16 Feb 2015 20:50:43 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * 0.0 FREEMAIL_FROM Sender email is commonly abused enduser
	mail provider *      (bruce.ashfield[at]gmail.com)
	* -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at http://www.dnswl.org/,
	low *      trust
	*      [209.85.217.182 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-lb0-f182.google.com (mail-lb0-f182.google.com
	[209.85.217.182])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 4202CE00777
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:50:40 -0800 (PST)
Received: by lbiw7 with SMTP id w7so2321525lbi.9
	for <meta-virtualization@yoctoproject.org>;
	Mon, 16 Feb 2015 20:50:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=nnFN9SMQ3OjRdvij6EfNr1OrMnhXId+mtISgJ+mMReo=;
	b=hLu4HL7ZoXeMGQ7e0l0MfJjiNx7DUt0YRBLn8TfEv3JQJXxZIWQi8MVrjATP+/vEhY
	C3oKB5B2aj5tenYZ33qHCyntH/PvDnYt321cNagCSrei1wG3dnqKcVR+7DZCNk3fD3s6
	2rYL7S1lV9SQNilouHkr3W7ifTd8d4x1deA3UwGC/K2cOarhcgzGRvOLpiOhEovnzVeV
	2SuZYdLwYfuyQFLEjXPvPLBpLwB50y0oyzs5jRZPkkNqqZrqW/ZV+eEu7WabMIXz98Ec
	zD5p6wrGU3lD819PJnw8aKFhQ1cf58IzJK/bC6qVtz+bn9oEl7Ru97jBz4BmDk4MomtN
	3b9A==
MIME-Version: 1.0
X-Received: by 10.112.203.229 with SMTP id kt5mr24707273lbc.121.1424148638764; 
	Mon, 16 Feb 2015 20:50:38 -0800 (PST)
Received: by 10.112.40.34 with HTTP; Mon, 16 Feb 2015 20:50:38 -0800 (PST)
In-Reply-To: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
References: <1423823713-57878-1-git-send-email-tudor.florea@enea.com>
Date: Mon, 16 Feb 2015 23:50:38 -0500
Message-ID: <CADkTA4N3mKq-X9e5EA4RmHOEcMbqjqYpTuuz+Q5uZ1GsgbAZJQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tudor Florea <tudor.florea@enea.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 0/3] Small correction for the previous pathces
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
X-List-Received-Date: Tue, 17 Feb 2015 04:50:43 -0000
Content-Type: text/plain; charset=UTF-8

Argh. I had fixed these locally, but didn't push the changes.

Sorry for the breakage. I've rebased and pushed my changes now.

Bruce

On Fri, Feb 13, 2015 at 5:35 AM, Tudor Florea <tudor.florea@enea.com> wrote:
> This is to really apply previous couple of patches for yajl-ruby and json.
> Also remove a patch for iproute2 as the code is already applied.
>
> Tudor Florea (3):
>   json: make the previous patch really apply
>   yajl-ruby: make the previous patch really apply
>   iproute2: remove patch already applied
>
>  meta-openstack/recipes-devtools/ruby/json_git.bb   |  2 +-
>  .../recipes-devtools/ruby/yajl-ruby_git.bb         |  2 +-
>  ...003-Don-t-enforce-that-dev-already-exists.patch | 27 ----------------------
>  .../iproute2/iproute2_3.16.0.bbappend              |  2 --
>  4 files changed, 2 insertions(+), 31 deletions(-)
>  delete mode 100644 meta-openstack/recipes-support/iproute2/iproute2/0003-Don-t-enforce-that-dev-already-exists.patch
>
> --
> 1.9.1
>
> --
> _______________________________________________
> meta-virtualization mailing list
> meta-virtualization@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-virtualization



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

