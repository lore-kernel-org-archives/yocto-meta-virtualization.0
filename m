Return-Path: <alejandro.delcastillo@ni.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 91714E004F6; Tue, 12 May 2015 08:39:05 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00, RCVD_IN_DNSWL_NONE, 
	SPF_HELO_PASS autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [130.164.80.24 listed in list.dnswl.org]
	* -0.0 SPF_HELO_PASS SPF: HELO matches SPF record
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 51972E0027F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 May 2015 08:39:02 -0700 (PDT)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	t4CFcxU8007916; Tue, 12 May 2015 10:39:00 -0500
Received: from [10.2.33.36] ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6)
	with ESMTP id 2015051210383817-1315494 ;
	Tue, 12 May 2015 10:38:38 -0500 
Message-ID: <55521E7C.1060105@ni.com>
Date: Tue, 12 May 2015 10:38:36 -0500
From: Alejandro del Castillo <alejandro.delcastillo@ni.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1431098920-13669-1-git-send-email-alejandro.delcastillo@ni.com>
	<CADkTA4OeKO0ccSu24as0U5EkmAFJFMOnejbQbgbiu=5pOceRjg@mail.gmail.com>
In-Reply-To: <CADkTA4OeKO0ccSu24as0U5EkmAFJFMOnejbQbgbiu=5pOceRjg@mail.gmail.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/12/2015 10:38:38 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6|November 21, 2013) at 05/12/2015 10:39:00 AM,
	Serialize complete at 05/12/2015 10:39:00 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2015-05-12_06:, , signatures=0
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, code@joelwhitehouse.com,
	perlhoser@gmail.com
Subject: Re: [PATCH] salt: add recipe for salt
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
X-List-Received-Date: Tue, 12 May 2015 15:39:05 -0000
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=utf-8



On 05/11/2015 11:08 PM, Bruce Ashfield wrote:
> The series looks good to me, I've queued it locally and will push it soon.
> Is there a README or HOWTO for any runtime testing ?

There is a ton of documentation on SaltStack website
(http://docs.saltstack.com/en/latest/contents.html). The help is extensive,
which can make it overwhelming.

The recipe has 6 components that provide different System Configuration
Management functionality. For embedded, I expect the majority of the use cases
will involve running only the salt-minion, but I did test all the components.
The components:

salt-master (daemon).-
salt-minion (daemon)
salt-syndic (daemon)
salt-ssh
salt-api  (daemon)
salt-cloud

If it helps, I can send you the testing that I did for each component.

> Bruce
>
-- 
Cheers,

Alejandro

