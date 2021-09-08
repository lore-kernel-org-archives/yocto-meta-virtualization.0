Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web12.15987.1631125758934163370
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Sep 2021 11:29:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=Y4TISpTp;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 6471A8344B;
	Wed,  8 Sep 2021 20:29:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1631125756;
	bh=p0TiiPd6vKz23waXpDJcdKnF5emlhmCfivtu0mSNZGE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Y4TISpTp7WEZ2lFLkRBGFnRMwME1lWQ5K1dxEjR6ZhlmiAm+vdRrRoYbkGrf0X2+H
	 Nk7HiIBUNtBygGORqFlMe6Y80Qc+P1/13by+RncxtuJhjDvNDhr4AjqfIcxbrG2Nka
	 rk829nTwLVVlcehi2qiMCqiB7Vnd/edSDr70I1sVMBC1uW+6rIvCkBqqC0t/K2Yl4R
	 xyuhk7qvlDYAelgdVHRUOC+AhxhGeyk8Cvj5d+sY8FdwryibpcZeOIS9jvEGCDyIeD
	 HW16suG/a3QIhJicgGteS/J1anEFc0Z/qG2w1/tjcnkDDWjaqDBoom0o/DPttzbDbV
	 NTRDDFFRB4PJQ==
MIME-Version: 1.0
Date: Wed, 08 Sep 2021 15:29:16 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Otavio Salvador
 <otavio@ossystems.com.br>, Marek Vasut <marex@denx.de>
Subject: Re: [meta-virtualization][PATCH dunfell] containers: Explictly reference a valid branch
In-Reply-To: <CADkTA4O92EpgmyNO1ZhBi0OV8hNdZO7=tNc8jZwfEDkDZFg0sg@mail.gmail.com>
References: <20210908180214.1302459-1-festevam@denx.de>
 <CADkTA4O92EpgmyNO1ZhBi0OV8hNdZO7=tNc8jZwfEDkDZFg0sg@mail.gmail.com>
Message-ID: <2153cd79fc3fdeff42e8d0926adb7863@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 08/09/2021 15:07, Bruce Ashfield wrote:
> On Wed, Sep 8, 2021 at 2:02 PM Fabio Estevam <festevam@denx.de> wrote:
>> 
>> These repositories have dropped their master branches,
>> so the fetcher default no longer works.
>> 
>> Point to an existing branch to fix the fetch failure.
>> 
>> Signed-off-by: Fabio Estevam <festevam@denx.de>
>> ---
>> Sorry for the resend.
>> 
>> I was not subscribed to the list in the first time.
> 
> You are working on an out of date master, or an old branch.

I am working on dunfell.

> If you want some of the branch changes cherry picked, specify the
> commit and branch, and I can do that.

Could you please cherry-pick the four commits below to dunfell to fix 
the build?

oci-image-spec_git: 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=96712be73dbca60fdceb4be68e5454944fe42d50

podman compose: 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/podman-compose/podman-compose_0.1.5.bb?id=f32657ae6efd35e259147582ed12fb864688402a

podman: 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/podman/podman_git.bb?id=4344c3db4054fae135d2d2d72c2300994f69f8d4

skopeo: 
https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/recipes-containers/skopeo/skopeo_git.bb?id=c3fe6ab4276444d0ac0c1de23a935d77fc2f4404

Thanks,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de
