Return-Path: <denis@eukrea.com>
Received: from mo1.mail-out.ovh.net (9.mo1.mail-out.ovh.net [178.32.108.172])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 0A5BDE0078E
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Dec 2013 00:24:50 -0800 (PST)
Received: from mail616.ha.ovh.net (b9.ovh.net [213.186.33.59])
	by mo1.mail-out.ovh.net (Postfix) with SMTP id 1B256FF9C6C
	for <meta-virtualization@yoctoproject.org>;
	Fri,  6 Dec 2013 09:27:47 +0100 (CET)
Received: from b0.ovh.net (HELO queueout) (213.186.33.50)
	by b0.ovh.net with SMTP; 6 Dec 2013 10:27:22 +0200
Received: from pac33-3-88-170-243-169.fbx.proxad.net (HELO ?192.168.1.18?)
	(denis@eukrea.com@88.170.243.169)
	by ns0.ovh.net with SMTP; 6 Dec 2013 10:27:21 +0200
Message-ID: <52A189CE.5020707@eukrea.com>
Date: Fri, 06 Dec 2013 09:24:46 +0100
From: Denis Carikli <denis@eukrea.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.1
MIME-Version: 1.0
To: Bruce Ashfield <bruce.ashfield@gmail.com>
References: <1386179341-19457-1-git-send-email-denis@eukrea.com>	<1386179341-19457-2-git-send-email-denis@eukrea.com>
	<CADkTA4OYOeJ0eXCrCQZPRR=SGZM-w+Op62sTo8YcMVJ4Jy2N-A@mail.gmail.com>
In-Reply-To: <CADkTA4OYOeJ0eXCrCQZPRR=SGZM-w+Op62sTo8YcMVJ4Jy2N-A@mail.gmail.com>
X-Ovh-Tracer-Id: 9973502850827165015
X-Ovh-Remote: 88.170.243.169 (pac33-3-88-170-243-169.fbx.proxad.net)
X-Ovh-Local: 213.186.33.20 (ns0.ovh.net)
X-OVH-SPAMSTATE: OK
X-OVH-SPAMSCORE: -100
X-OVH-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiledrkeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-Spam-Check: DONE|U 0.5/N
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrfeeiledrkeejucetufdoteggodetrfcurfhrohhfihhlvgemucfqggfjnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Cc: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
Subject: Re: [PATCH 2/2] python-babel: add native support.
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
X-List-Received-Date: Fri, 06 Dec 2013 08:24:53 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/05/2013 08:10 PM, Bruce Ashfield wrote:
> Out of curiosity, what is using the native version of the package ? I'd like
> to get that in the commit log.
Any python package with a setup.py that uses 
babel.messages.frontend.extract_messages and 
babel.messages.frontend.compile_catalog will need that.

Denis.

