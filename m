Return-Path: <Fahad_Usman@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C8641E00406
	for <meta-virtualization@yoctoproject.org>;
	Fri, 16 Aug 2013 07:59:41 -0700 (PDT)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1VALV5-0005uV-HZ from Fahad_Usman@mentor.com ;
	Fri, 16 Aug 2013 07:59:39 -0700
Received: from SVR-IES-FEM-01.mgc.mentorg.com ([137.202.0.104]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Fri, 16 Aug 2013 07:59:39 -0700
Received: from [137.202.157.99] (137.202.0.76) by
	SVR-IES-FEM-01.mgc.mentorg.com (137.202.0.104) with Microsoft SMTP
	Server (TLS) id 14.2.247.3; Fri, 16 Aug 2013 15:59:37 +0100
Message-ID: <520E3E46.6050501@mentor.com>
Date: Fri, 16 Aug 2013 19:59:18 +0500
From: "Usman, Fahad" <Fahad_Usman@mentor.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <meta-virtualization@yoctoproject.org>
References: <520E3BB8.1090708@mentor.com>
In-Reply-To: <520E3BB8.1090708@mentor.com>
X-Originating-IP: [137.202.0.76]
X-OriginalArrivalTime: 16 Aug 2013 14:59:39.0335 (UTC)
	FILETIME=[3B221D70:01CE9A91]
Subject: remove the bbappend of busybox?
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
X-List-Received-Date: Fri, 16 Aug 2013 14:59:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
I am trying to use meta-virtualization layer with master branches of 
poky and meta-oe. But meta-virtualization contains a .bbappend for an 
older version of busybox which causes the build to fail. The patch that 
this .bbappend file adds has already been merged into the newer version 
of busybox so it would not be needed with the newer version.

There is also a defconfig file for busybox in meta-virtualization layer, 
and I am not sure if it's needed or not. If it's not needed then I can 
send a pull request to remove busybox .bbappend and defconfig file.

Regards,
Fahad Usman.

