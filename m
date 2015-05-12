Return-Path: <bruce.ashfield@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 583D0E004F6; Tue, 12 May 2015 09:20:05 -0700 (PDT)
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
	*      [209.85.213.44 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-yh0-f44.google.com (mail-yh0-f44.google.com
	[209.85.213.44])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 65EF5E0027F
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 May 2015 09:20:03 -0700 (PDT)
Received: by yhom41 with SMTP id m41so3779145yho.1
	for <meta-virtualization@yoctoproject.org>;
	Tue, 12 May 2015 09:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VuLxpBgEKCFzSjo4+GGI/6QvLMHwwcJfy34VxlEZU/A=;
	b=PXXbTFRXVdzq619rQb1HNxiOvf/wOQNyVmpaG50yWrn+xBPQIbub+WS49e79aW2g3T
	zDDt/YrkGlezjJ6dMRlG02ZVTaOsgTaZIEAcWPckF3TMArhXMsVmejkkJaYe/ZDaNhyi
	vIgvaJNel+Fhpe+bJWThn4QksIxnASL3fqDSkFk+g8PbHffo1CIu8JASpcx4Q6JPxSgY
	4zPYBpUwdJSacBlmzSrVocg/c5vLbUQVrANy8M+FsNlGGIkM1kWMvB6Lw/yUX4j2yvah
	3/pWJYNJjnH8dUu9ixrV2zJ5DF+X1yZsIAcx0PYfN2e7V9eaHynIBPhVz9sBb7UCKJCK
	1kZw==
MIME-Version: 1.0
X-Received: by 10.236.105.142 with SMTP id k14mr12478889yhg.12.1431447603422; 
	Tue, 12 May 2015 09:20:03 -0700 (PDT)
Received: by 10.129.128.2 with HTTP; Tue, 12 May 2015 09:20:03 -0700 (PDT)
In-Reply-To: <55521E7C.1060105@ni.com>
References: <1431098920-13669-1-git-send-email-alejandro.delcastillo@ni.com>
	<CADkTA4OeKO0ccSu24as0U5EkmAFJFMOnejbQbgbiu=5pOceRjg@mail.gmail.com>
	<55521E7C.1060105@ni.com>
Date: Tue, 12 May 2015 12:20:03 -0400
Message-ID: <CADkTA4O5W=Yfrqihq2tkGL4fRULHZM2OG9AJSsgpASk4h=Bw_g@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>, code@joelwhitehouse.com,
	Joseph Hall <perlhoser@gmail.com>
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
X-List-Received-Date: Tue, 12 May 2015 16:20:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 12, 2015 at 11:38 AM, Alejandro del Castillo
<alejandro.delcastillo@ni.com> wrote:
>
>
> On 05/11/2015 11:08 PM, Bruce Ashfield wrote:
>> The series looks good to me, I've queued it locally and will push it soon.
>> Is there a README or HOWTO for any runtime testing ?
>
> There is a ton of documentation on SaltStack website
> (http://docs.saltstack.com/en/latest/contents.html). The help is extensive,
> which can make it overwhelming.

I find the same thing with all of openstack :)

>
> The recipe has 6 components that provide different System Configuration
> Management functionality. For embedded, I expect the majority of the use cases
> will involve running only the salt-minion, but I did test all the components.
> The components:
>
> salt-master (daemon).-
> salt-minion (daemon)
> salt-syndic (daemon)
> salt-ssh
> salt-api  (daemon)
> salt-cloud
>
> If it helps, I can send you the testing that I did for each component.


That would be great!

Bruce

>
>> Bruce
>>
> --
> Cheers,
>
> Alejandro



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

