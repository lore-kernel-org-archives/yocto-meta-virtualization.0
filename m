Return-Path: <Bruce.Ashfield@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C73E9E00CCD; Wed, 17 Aug 2016 19:54:02 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at http://www.dnswl.org/,
	*      medium trust
	*      [147.11.146.13 listed in list.dnswl.org]
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 9929EE00CC4;
	Wed, 17 Aug 2016 19:53:58 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7I2rsSp011548
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Aug 2016 19:53:54 -0700 (PDT)
Received: from server.local (128.224.20.81) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 17 Aug 2016 19:53:53 -0700
To: Paul Eggleton <paul.eggleton@linux.intel.com>, <kai.kang@windriver.com>
References: <20160816032135.26626-1-kai.kang@windriver.com>
	<9902c64e-d16d-e40a-1246-8689311d82a0@windriver.com>
	<1737638.89iAf3Zfcv@peggleto-mobl.ger.corp.intel.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <c75c6012-1ccf-4629-db47-fe26ba803c99@windriver.com>
Date: Wed, 17 Aug 2016 22:53:53 -0400
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.11; rv:45.0)
	Gecko/20100101 Thunderbird/45.2.0
MIME-Version: 1.0
In-Reply-To: <1737638.89iAf3Zfcv@peggleto-mobl.ger.corp.intel.com>
Cc: yocto@yoctoproject.org, "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [yocto] [PATCH] libvirt: fix CVE-2016-5008
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
X-List-Received-Date: Thu, 18 Aug 2016 02:54:02 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-08-17 6:08 PM, Paul Eggleton wrote:
> On Tue, 16 Aug 2016 11:18:53 Bruce Ashfield wrote:
>> Still going to the wrong list use: meta-virtualization@yoctoproject.org.
>
> FYI I can recommend the following to make this easy in future (it's how I deal
> with the issue):
>
>   http://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded#Streamlining_git-send-email_with_configuration
>

cool.

Thanks Paul.

Bruce

> Cheers,
> Paul
>


