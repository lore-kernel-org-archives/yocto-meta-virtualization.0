Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
 by mx.groups.io with SMTP id smtpd.web11.8658.1634302147874494686
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 15 Oct 2021 05:49:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@denx.de header.s=phobos-20191101 header.b=pDQJPx/7;
 spf=pass (domain: denx.de, ip: 85.214.62.61, mailfrom: festevam@denx.de)
Received: from mail.denx.de (unknown [IPv6:2a01:238:438b:c500:173d:9f52:ddab:ee01])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(No client certificate requested)
	(Authenticated sender: festevam@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2385F83847;
	Fri, 15 Oct 2021 14:49:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1634302144;
	bh=MYwM15Lx7YkstRbxgAERGZaGKapQ9t+zp2YBuFEPzzs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=pDQJPx/7iZYC5Rzkz6RkrV7noyMFZzWZW70+CffFVaZ/jmF0YotenNCuA3uUtFeKS
	 amS21to1mCdiJMD6YxX/3uN5p+fDOhhzk+HYyCsF8mpCwjM/7/UVwUw9jFTkoIpA04
	 I+745Dp9MDqjDcDGdM+bEOC2vjoVZq6AAvwOW7M/nQQuyw0Do4sHvevhF5tj5lZFuc
	 2fUDRC43gO2VChCrc0LpnbaUtpuYvyMSfKyUgHaYOVlRUjqHaH4svJNO6GvECOGbG+
	 s6S5sCuWehi/qj4X+9bQiZ4bGyVQYaimcxUMHuh6db753yz9in4Mr2SRYMsM6Jcgmo
	 OEWolK4UoZ9KQ==
MIME-Version: 1.0
Date: Fri, 15 Oct 2021 09:49:04 -0300
From: "Fabio Estevam" <festevam@denx.de>
To: bruce.ashfield@gmail.com, Nathan.Dunne@arm.com
Cc: meta-virtualization@lists.yoctoproject.org, otavio@ossystems.com.br
Subject: Re: ip6tables executable not getting installed in dunfell
In-Reply-To: <ad014c7cc4e8d1bcd4f499229d09e013@denx.de>
References: <ad014c7cc4e8d1bcd4f499229d09e013@denx.de>
Message-ID: <8227d089c2ea3916874c0818ef882fa1@denx.de>
X-Sender: festevam@denx.de
User-Agent: Roundcube Webmail/1.3.6
X-Virus-Scanned: clamav-milter 0.103.2 at phobos.denx.de
X-Virus-Status: Clean
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

On 15/10/2021 01:40, Fabio Estevam wrote:
> Hi,
> 
> I am running the dunfell branch and I notice
> that ip6tables is not getting installed:

After passing 'ipv6' into DISTRO_FEATURES, ip6tables gets installed.

~# podman run hello-world
....
[  207.201607] cni-podman0: port 1(veth6b661354) entered disabled state
Error: systemd cgroup flag passed, but systemd support for managing 
cgroups is not available: OCI runtime error

Does anyone know how to add systemd support for managing cgroups?

Thanks,

Fabio Estevam
-- 
DENX Software Engineering GmbH,      Managing Director: Wolfgang Denk
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-60 Fax: (+49)-8142-66989-80 Email: 
festevam@denx.de
