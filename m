Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 85DC4E00D00; Fri, 19 Feb 2016 08:38:52 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 15595E00C44
	for <meta-virtualization@yoctoproject.org>;
	Fri, 19 Feb 2016 08:38:49 -0800 (PST)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u1JGcigK006999
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Fri, 19 Feb 2016 08:38:44 -0800
Received: from server.local (147.11.119.118) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 19 Feb 2016 08:38:43 -0800
To: Josep Puigdemont <josep.puigdemont@enea.com>,
	<meta-virtualization@yoctoproject.org>
References: <20160219102913.GB5403@iapetus.enea.se>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <56C74513.2000301@windriver.com>
Date: Fri, 19 Feb 2016 11:38:43 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:38.0)
	Gecko/20100101 Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <20160219102913.GB5403@iapetus.enea.se>
Subject: Re: cherry pick 73fc67b1c056ac
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
X-List-Received-Date: Fri, 19 Feb 2016 16:38:52 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-02-19 5:29 AM, Josep Puigdemont wrote:
> Hi Bruce,
>
> could you cherry pick 73fc67b1c056aca938a9ffa743de52995f380b03 from
> fido-kilo to master? It seems this never got picked up in master. The
> commit will honor DISTRO_FEATURES and will add xterm to the image
> only if x11 is enabled.

Done!

Bruce

>
> Thanks!
>
> /Josep
>


