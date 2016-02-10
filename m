Return-Path: <mbgrego@tycho.nsa.gov>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id C1D03E00CE5; Wed, 10 Feb 2016 06:07:31 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [63.239.67.10 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from emvm-gh1-uea09.nsa.gov (emvm-gh1-uea09.nsa.gov [63.239.67.10])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id ED633E00CD8
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 06:07:27 -0800 (PST)
X-TM-IMSS-Message-ID: <0f0e905d0001f4d1@nsa.gov>
Received: from tarius.tycho.ncsc.mil ([144.51.242.1]) by nsa.gov
	([10.208.42.194]) with ESMTP (TREND IMSS SMTP Service 7.1) id
	0f0e905d0001f4d1 ; Wed, 10 Feb 2016 09:10:35 -0500
Received: from moss-wolfpack.infosec.tycho.ncsc.mil (moss-wolfpack
	[192.168.25.76])
	by tarius.tycho.ncsc.mil (8.14.4/8.14.4) with ESMTP id u1AE7QXu022413
	for <meta-virtualization@yoctoproject.org>;
	Wed, 10 Feb 2016 09:07:26 -0500
To: meta-virtualization@yoctoproject.org
References: <56B10C90.8070709@tycho.nsa.gov> <56B126BC.3070304@tycho.nsa.gov>
	<CABZSBQd+vLUkLi-1MPYN9-frgOeUygDuZsDezQWmktiGhkACMQ@mail.gmail.com>
	<56B3BA85.7020008@tycho.nsa.gov>
From: "M. Gregory" <mbgrego@tycho.nsa.gov>
Message-ID: <56BB43D2.10004@tycho.nsa.gov>
Date: Wed, 10 Feb 2016 09:06:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <56B3BA85.7020008@tycho.nsa.gov>
X-TM-AS-MML: disable
Subject: Re: stubs-32.h not found
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
X-List-Received-Date: Wed, 10 Feb 2016 14:07:31 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



On 02/04/2016 03:54 PM, M. Gregory wrote:
> On 02/04/2016 03:52 PM, Chris Patterson wrote:
>> I repro'd this with a fresh tree.  Instead of the depends approach, I
>> simply moved the step between do_configure and do_compile, which
>> should be OK?
>>
>> diff --git a/recipes-extended/xen/xen.inc b/recipes-extended/xen/xen.inc
>> index 5555ed3..d35bc3f 100644
>> --- a/recipes-extended/xen/xen.inc
>> +++ b/recipes-extended/xen/xen.inc
>> @@ -782,7 +782,7 @@ do_stubs() {
>>      fi
>>  }
>>
>> -addtask stubs after do_patch before do_configure
>> +addtask stubs after do_configure before do_compile
>>
>>  do_configure() {
> yes.
Can you submit this as a patch?
-Machon

