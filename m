Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web08.3571.1631213298161808483
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 09 Sep 2021 11:48:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=XsC7zxNx;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 5A9AE8317A;
	Thu,  9 Sep 2021 20:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1631213295;
	bh=ZhQ95hn6r35+phXUQWNChHLJhsBEV9XoD5c4bDW6zE4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=XsC7zxNxp1A7ij5hK7U6zIiRHnlU+G+myuKw3RELRSEnDDnO+u+fUvvwomHs4yiwx
	 e4gIyVh3FPxS/TNGhYKapjB8TsXaZS3Oiyk4s62DuNcamTCAj4Xp7eS3eF0xaMUzXF
	 urwmRKSJ/PAMAdcplENh5rFOTXGDLBUAmqKq9JqukFDUD6KipzrLDfAX09qlJzYQRU
	 KATJe/JuyS9Za4sgD31MsQGnHcfNoCBy5sfm5NvT6OPPl4l5noRJIpwrqeVu5XqgR5
	 NQ0PrQl3IekDSNfjn6li8FhbRf/BYjnQq0kl59FJvh0ZhyI1eSiacwtEYIwSCgBf3u
	 4POmFHmp8x47w==
MIME-Version: 1.0
Date: Thu, 09 Sep 2021 15:48:15 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, Otavio Salvador
 <otavio@ossystems.com.br>, Marek Vasut <marex@denx.de>
Subject: Re: [meta-virtualization][PATCH dunfell] containers: Explictly reference a valid branch
In-Reply-To: <CADkTA4NkfPNkDHZeGTbqRxOgecgEWyo19e6g8VpdJAL8JjwZiQ@mail.gmail.com>
References: <20210908180214.1302459-1-festevam@denx.de>
 <CADkTA4O92EpgmyNO1ZhBi0OV8hNdZO7=tNc8jZwfEDkDZFg0sg@mail.gmail.com>
 <2153cd79fc3fdeff42e8d0926adb7863@denx.de>
 <CADkTA4NkfPNkDHZeGTbqRxOgecgEWyo19e6g8VpdJAL8JjwZiQ@mail.gmail.com>
Message-ID: <85e0e7f996d8846a71c391d31feef01b@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Bruce,

On 09/09/2021 15:32, Bruce Ashfield wrote:

> These have been cherry-picked into dunfell.

Excellent, I am able to build dunfell now.

Thanks!

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de
