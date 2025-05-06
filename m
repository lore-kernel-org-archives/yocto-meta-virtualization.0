Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5952C3ABB6
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 01:47:41 +0000 (UTC)
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
 by mx.groups.io with SMTP id smtpd.web11.67317.1746496054736757751
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 05 May 2025 18:47:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=H6QPF+Ov;
 spf=pass (domain: gmail.com, ip: 209.85.219.41, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6ecf99dd567so69927396d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 05 May 2025 18:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746496054; x=1747100854; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JWZEyCvodmkyIWjgdO4jOunOiNXTqQxXhqQG7HoUhzk=;
        b=H6QPF+Ovp/SBmbIjEjQUqC/t8F0eyjCNLvES84elnhFg8wZcT9VM2gPRpIDaIQ6SAm
         xB5o1nZIa7qH+85Wkob4yGQPAULWVk/GyrctVzHUPkSF5aJIipEJwfKU8H+6SIBYqJn4
         CaP6ZIxDO9SjwVyaAd/nA9s/yXvZwn9tgCnkku8D0w75Z7LJfks4lXkLoiXInZH0ctHj
         hm5xWuqpJhbCdurw7s5LxvrFAn1OHW/snYlTa78bWsMAA0Tw1mPsEW/x5YmFGLKCvZ4G
         wyMrhGEdiraleiqrdcmyvTjvzvcKirjQcadwqIJTUH+oGeexjWqNl2aDSmz7yaGIrE0J
         vmqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746496054; x=1747100854;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JWZEyCvodmkyIWjgdO4jOunOiNXTqQxXhqQG7HoUhzk=;
        b=Trbw8v3ZoNn6enp3juasEtXAqegcUYF7uANbrJ0GVMFUr2qlAroLgzvk9xFCJz8kqy
         7AeAY1iXQnv7S4v/J00Ht53IqO1RQIAODsKLDHfXcCDqcyViVRQ0d0qSiSbxHcbHFWgk
         xDwyK5mzBUKMOCjaIILiZDay7Y4O6t1Evfig1Py5sxx5hyu5JJqzc63MvzVH+NHub7Pm
         IjqHZrT759vFyBDmFbLUnr65vSMaxGO1TJe67HwRNq0XZOPDeh2beQVcBoCku2YGAJz2
         WI36GTaD1rD9hwk4oPd1JEravSTdIMm3WsIlYKc20M2URWiIWmdKKqIvIfW3yhCUid1I
         CuCA==
X-Gm-Message-State: AOJu0YzPYLKJohO8O8AK2xDeW+9pUNccYu7ufVUewEgMAFNvhFMnw9i3
	P1Yo0gsenorbYHWtuHXRZwtWwyENz3wK0jPUJHsIerRi6szINIauVD5jLD5U
X-Gm-Gg: ASbGncvRdpFQqzeqhkAKlvWZkRY4FZkPdpe6skKOt4+3glPbTbvXb/DFEhBsqvmWLd7
	dy2UPCbipUBwYc/YrcHqEzdB8CIP3WAlLgOXRzBIqbIGRXNF6rJpNafVhnZHuJQE+2IA13BoT0U
	TBq6cL3nngtuaaYRWY0FJB9UHUvSF+JuNiiE51F5l2oIAoyvYBKb6d2LArR+LDphxvU5ijQJYnw
	Qj9oA+65mIDUSp8ScGFvzPHkcBTW3t4niXtVFvtSOXetHr9PaRXDJxj9PgZ4ISbyYWa7u+tYNuX
	cjr1lv1wCSDgg3V24gMp57+zR1L7253jfiWziZjeM74nf+7j9d2sGj//OIuJwbdU7KO89r53+qJ
	UITj7j5sKQOMi7g35YCw=
X-Google-Smtp-Source: AGHT+IG+vQzvS5BlE2xMfUHHq1bE5p+ZW8lcfkXOEmZNR+y69BG7uGWUEhsDOp3FSOWRiA7YzjRFsQ==
X-Received: by 2002:a05:6214:62c:b0:6f5:10b5:cd2d with SMTP id 6a1803df08f44-6f528c3ec38mr163598296d6.7.1746496052998;
        Mon, 05 May 2025 18:47:32 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f50f3d35f0sm63112086d6.68.2025.05.05.18.47.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 18:47:32 -0700 (PDT)
Date: Tue, 6 May 2025 01:47:30 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: soumya.sambu@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][meta-cloud-services][kirkstone][PATCH 1/1]
 python3-ansible: Fix CVE-2023-5764
Message-ID: <aBlqMrAeJx4hm84J@gmail.com>
References: <20250425105025.972837-1-soumya.sambu@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250425105025.972837-1-soumya.sambu@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 06 May 2025 01:47:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9244

When I try and apply the patch:

Applying: python3-ansible: Fix CVE-2023-5764
error: corrupt patch at line 1732
Patch failed at 0001 python3-ansible: Fix CVE-2023-5764
hint: Use 'git am --show-current-patch=diff' to see the failed patch
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Can you double check your patch sending configuration and resend ?

Bruce

In message: [meta-virtualization][meta-cloud-services][kirkstone][PATCH 1/1] python3-ansible: Fix CVE-2023-5764
on 25/04/2025 Soumya via lists.yoctoproject.org wrote:

> From: Soumya Sambu <soumya.sambu@windriver.com>
> 
> A template injection flaw was found in Ansible where a user's controller internal
> templating operations may remove the unsafe designation from template data. This
> issue could allow an attacker to use a specially crafted file to introduce templating
> injection when supplying templating data.
> 
> References:
> https://nvd.nist.gov/vuln/detail/CVE-2023-5764
> https://security-tracker.debian.org/tracker/CVE-2023-5764
> 
> Upstream patch:
> https://github.com/ansible/ansible/commit/7239d2d371bc6e274cbb7314e01431adce6ae25a
> 
> Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> ---
>  .../python3-ansible/CVE-2023-5764.patch       | 1737 +++++++++++++++++
>  .../python/python3-ansible_2.14.11.bb         |    1 +
>  2 files changed, 1738 insertions(+)
>  create mode 100644 recipes-devtools/python/python3-ansible/CVE-2023-5764.patch
> 
> diff --git a/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch b/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch
> new file mode 100644
> index 00000000..cfc7e21e
> --- /dev/null
> +++ b/recipes-devtools/python/python3-ansible/CVE-2023-5764.patch
> @@ -0,0 +1,1737 @@
> +From 7239d2d371bc6e274cbb7314e01431adce6ae25a Mon Sep 17 00:00:00 2001
> +From: Matt Martz <matt@sivel.net>
> +Date: Mon, 27 Nov 2023 12:27:58 -0600
> +Subject: [PATCH] Ensure that unsafe is more difficult to lose [stable-2.14]
> + (#82295)
> +
> +* Ensure that unsafe is more difficult to lose
> +
> +* Add Task.untemplated_args, and switch assert over to use it
> +* Don't use re in first_found, switch to using native string methods
> +* If nested templating results in unsafe, just error, don't continue
> +
> +(cherry picked from commit 586f1924512b01305f896d9ae4732773023013a3)
> +
> +* ci_complete
> +
> +CVE: CVE-2023-5764
> +
> +Upstream-Status: Backport [https://github.com/ansible/ansible/commit/7239d2d371bc6e274cbb7314e01431adce6ae25a]
> +
> +Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
> +---
> + changelogs/fragments/cve-2023-5764.yml        |   6 +
> + lib/ansible/module_utils/common/json.py       |   4 +-
> + lib/ansible/parsing/yaml/dumper.py            |   6 +-
> + lib/ansible/playbook/conditional.py           |   9 +-
> + lib/ansible/playbook/task.py                  |  24 ++
> + lib/ansible/plugins/action/assert.py          |  23 +-
> + lib/ansible/plugins/callback/__init__.py      |   4 +-
> + lib/ansible/plugins/filter/core.py            |   5 +
> + lib/ansible/plugins/lookup/first_found.py     |  15 +-
> + lib/ansible/template/__init__.py              |  15 +-
> + lib/ansible/utils/unsafe_proxy.py             | 265 +++++++++++++++++-
> + .../tasks/scm_dependency_deduplication.yml    |  16 +-
> + .../roles/test_vault_embedded/tasks/main.yml  |   2 +-
> + .../tasks/main.yml                            |   2 +-
> + .../targets/apt_repository/tasks/apt.yml      |  10 +-
> + .../assert/assert.out.nested_tmpl.stderr      |   4 +
> + .../assert/assert.out.nested_tmpl.stdout      |  12 +
> + ...t.quiet.stderr => assert.out.quiet.stderr} |   0
> + ...t.quiet.stdout => assert.out.quiet.stdout} |   0
> + .../targets/assert/nested_tmpl.yml            |   9 +
> + test/integration/targets/assert/quiet.yml     |   4 +-
> + test/integration/targets/assert/runme.sh      |   3 +-
> + .../targets/command_shell/tasks/main.yml      |   2 +-
> + test/integration/targets/copy/tasks/tests.yml |  42 +--
> + test/integration/targets/debug/runme.sh       |   2 +
> + test/integration/targets/debug/unsafe.yml     |  13 +
> + .../targets/dnf/tasks/test_sos_removal.yml    |   2 +-
> + .../integration/targets/expect/tasks/main.yml |   2 +-
> + test/integration/targets/file/tasks/main.yml  |   2 +-
> + .../targets/file/tasks/state_link.yml         |   2 +-
> + test/integration/targets/find/tasks/main.yml  |  12 +-
> + .../gathering_facts/test_gathering_facts.yml  |   4 +-
> + test/integration/targets/git/tasks/depth.yml  |   2 +-
> + .../targets/git/tasks/localmods.yml           |   4 +-
> + .../targets/git/tasks/submodules.yml          |  14 +-
> + .../tests/cli/check_config.yaml               |   4 +-
> + .../tests/cli/deleted.yaml                    |   8 +-
> + .../tests/cli/merged.yaml                     |   8 +-
> + .../tests/cli/overridden.yaml                 |   8 +-
> + .../tests/cli/replaced.yaml                   |   8 +-
> + .../targets/include_vars/tasks/main.yml       |  28 +-
> + .../lookup_ini/test_lookup_properties.yml     |   2 +-
> + .../targets/lookup_subelements/tasks/main.yml |   6 +-
> + .../targets/loop_control/inner.yml            |   4 +-
> + .../modules_test_multiple_roles.yml           |   2 +-
> + ...ules_test_multiple_roles_reverse_order.yml |   2 +-
> + .../multiple_roles/bar/tasks/main.yml         |   2 +-
> + .../multiple_roles/foo/tasks/main.yml         |   2 +-
> + .../integration/targets/script/tasks/main.yml |   4 +-
> + test/integration/targets/slurp/tasks/main.yml |   2 +-
> + .../targets/template/tasks/main.yml           |   2 +-
> + .../unarchive/tasks/test_missing_binaries.yml |   2 +-
> + .../targets/unarchive/tasks/test_mode.yml     |   8 +-
> + .../tasks/test_unprivileged_user.yml          |   2 +-
> + .../targets/unarchive/tasks/test_zip.yml      |   2 +-
> + .../targets/wait_for/tasks/main.yml           |   8 +-
> + test/units/parsing/yaml/test_dumper.py        |   7 +-
> + 57 files changed, 519 insertions(+), 143 deletions(-)
> + create mode 100644 changelogs/fragments/cve-2023-5764.yml
> + create mode 100644 test/integration/targets/assert/assert.out.nested_tmpl.stderr
> + create mode 100644 test/integration/targets/assert/assert.out.nested_tmpl.stdout
> + rename test/integration/targets/assert/{assert_quiet.out.quiet.stderr => assert.out.quiet.stderr} (100%)
> + rename test/integration/targets/assert/{assert_quiet.out.quiet.stdout => assert.out.quiet.stdout} (100%)
> + create mode 100644 test/integration/targets/assert/nested_tmpl.yml
> + create mode 100644 test/integration/targets/debug/unsafe.yml
> +
> +diff --git a/changelogs/fragments/cve-2023-5764.yml b/changelogs/fragments/cve-2023-5764.yml
> +new file mode 100644
> +index 0000000000..c37127dac1
> +--- /dev/null
> ++++ b/changelogs/fragments/cve-2023-5764.yml
> +@@ -0,0 +1,6 @@
> ++security_fixes:
> ++- templating - Address issues where internal templating can cause unsafe
> ++  variables to lose their unsafe designation (CVE-2023-5764)
> ++breaking_changes:
> ++- assert - Nested templating may result in an inability for the conditional
> ++  to be evaluated. See the porting guide for more information.
> +diff --git a/lib/ansible/module_utils/common/json.py b/lib/ansible/module_utils/common/json.py
> +index 727083ca23..c4333fc157 100644
> +--- a/lib/ansible/module_utils/common/json.py
> ++++ b/lib/ansible/module_utils/common/json.py
> +@@ -30,7 +30,7 @@ def _preprocess_unsafe_encode(value):
> +     Used in ``AnsibleJSONEncoder.iterencode``
> +     """
> +     if _is_unsafe(value):
> +-        value = {'__ansible_unsafe': to_text(value, errors='surrogate_or_strict', nonstring='strict')}
> ++        value = {'__ansible_unsafe': to_text(value._strip_unsafe(), errors='surrogate_or_strict', nonstring='strict')}
> +     elif is_sequence(value):
> +         value = [_preprocess_unsafe_encode(v) for v in value]
> +     elif isinstance(value, Mapping):
> +@@ -63,7 +63,7 @@ class AnsibleJSONEncoder(json.JSONEncoder):
> +                 value = {'__ansible_vault': to_text(o._ciphertext, errors='surrogate_or_strict', nonstring='strict')}
> +         elif getattr(o, '__UNSAFE__', False):
> +             # unsafe object, this will never be triggered, see ``AnsibleJSONEncoder.iterencode``
> +-            value = {'__ansible_unsafe': to_text(o, errors='surrogate_or_strict', nonstring='strict')}
> ++            value = {'__ansible_unsafe': to_text(o._strip_unsafe(), errors='surrogate_or_strict', nonstring='strict')}
> +         elif isinstance(o, Mapping):
> +             # hostvars and other objects
> +             value = dict(o)
> +diff --git a/lib/ansible/parsing/yaml/dumper.py b/lib/ansible/parsing/yaml/dumper.py
> +index 8701bb8196..bf2c0843c2 100644
> +--- a/lib/ansible/parsing/yaml/dumper.py
> ++++ b/lib/ansible/parsing/yaml/dumper.py
> +@@ -24,7 +24,7 @@ import yaml
> + from ansible.module_utils.six import text_type, binary_type
> + from ansible.module_utils.common.yaml import SafeDumper
> + from ansible.parsing.yaml.objects import AnsibleUnicode, AnsibleSequence, AnsibleMapping, AnsibleVaultEncryptedUnicode
> +-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafeBytes, NativeJinjaUnsafeText, NativeJinjaText
> ++from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafeBytes, NativeJinjaUnsafeText, NativeJinjaText, _is_unsafe
> + from ansible.template import AnsibleUndefined
> + from ansible.vars.hostvars import HostVars, HostVarsVars
> + from ansible.vars.manager import VarsWithSources
> +@@ -47,10 +47,14 @@ def represent_vault_encrypted_unicode(self, data):
> +
> +
> + def represent_unicode(self, data):
> ++    if _is_unsafe(data):
> ++        data = data._strip_unsafe()
> +     return yaml.representer.SafeRepresenter.represent_str(self, text_type(data))
> +
> +
> + def represent_binary(self, data):
> ++    if _is_unsafe(data):
> ++        data = data._strip_unsafe()
> +     return yaml.representer.SafeRepresenter.represent_binary(self, binary_type(data))
> +
> +
> +diff --git a/lib/ansible/playbook/conditional.py b/lib/ansible/playbook/conditional.py
> +index fe07358cbd..d994f8f49d 100644
> +--- a/lib/ansible/playbook/conditional.py
> ++++ b/lib/ansible/playbook/conditional.py
> +@@ -26,7 +26,7 @@ from jinja2.compiler import generate
> + from jinja2.exceptions import UndefinedError
> +
> + from ansible import constants as C
> +-from ansible.errors import AnsibleError, AnsibleUndefinedVariable
> ++from ansible.errors import AnsibleError, AnsibleUndefinedVariable, AnsibleTemplateError
> + from ansible.module_utils.six import text_type
> + from ansible.module_utils._text import to_native, to_text
> + from ansible.playbook.attribute import FieldAttribute
> +@@ -138,9 +138,10 @@ class Conditional:
> +             if not isinstance(conditional, text_type) or conditional == "":
> +                 return conditional
> +
> +-            # update the lookups flag, as the string returned above may now be unsafe
> +-            # and we don't want future templating calls to do unsafe things
> +-            disable_lookups |= hasattr(conditional, '__UNSAFE__')
> ++            # If the result of the first-pass template render (to resolve inline templates) is marked unsafe,
> ++            # explicitly fail since the next templating operation would never evaluate
> ++            if hasattr(conditional, '__UNSAFE__'):
> ++                raise AnsibleTemplateError('Conditional is marked as unsafe, and cannot be evaluated.')
> +
> +             # First, we do some low-level jinja2 parsing involving the AST format of the
> +             # statement to ensure we don't do anything unsafe (using the disable_lookup flag above)
> +diff --git a/lib/ansible/playbook/task.py b/lib/ansible/playbook/task.py
> +index ba35fcf0e3..a1a1162bf2 100644
> +--- a/lib/ansible/playbook/task.py
> ++++ b/lib/ansible/playbook/task.py
> +@@ -290,6 +290,30 @@ class Task(Base, Conditional, Taggable, CollectionSearch):
> +
> +         super(Task, self).post_validate(templar)
> +
> ++    def _post_validate_args(self, attr, value, templar):
> ++        # smuggle an untemplated copy of the task args for actions that need more control over the templating of their
> ++        # input (eg, debug's var/msg, assert's "that" conditional expressions)
> ++        self.untemplated_args = value
> ++
> ++        # now recursively template the args dict
> ++        args = templar.template(value)
> ++
> ++        # FIXME: could we just nuke this entirely and/or wrap it up in ModuleArgsParser or something?
> ++        if '_variable_params' in args:
> ++            variable_params = args.pop('_variable_params')
> ++            if isinstance(variable_params, dict):
> ++                if C.INJECT_FACTS_AS_VARS:
> ++                    display.warning("Using a variable for a task's 'args' is unsafe in some situations "
> ++                                    "(see https://docs.ansible.com/ansible/devel/reference_appendices/faq.html#argsplat-unsafe)")
> ++                variable_params.update(args)
> ++                args = variable_params
> ++            else:
> ++                # if we didn't get a dict, it means there's garbage remaining after k=v parsing, just give up
> ++                # see https://github.com/ansible/ansible/issues/79862
> ++                raise AnsibleError(f"invalid or malformed argument: '{variable_params}'")
> ++
> ++        return args
> ++
> +     def _post_validate_loop(self, attr, value, templar):
> +         '''
> +         Override post validation for the loop field, which is templated
> +diff --git a/lib/ansible/plugins/action/assert.py b/lib/ansible/plugins/action/assert.py
> +index 7721a6b47c..e8ab6a9a4f 100644
> +--- a/lib/ansible/plugins/action/assert.py
> ++++ b/lib/ansible/plugins/action/assert.py
> +@@ -63,8 +63,29 @@ class ActionModule(ActionBase):
> +
> +         quiet = boolean(self._task.args.get('quiet', False), strict=False)
> +
> ++        # directly access 'that' via untemplated args from the task so we can intelligently trust embedded
> ++        # templates and preserve the original inputs/locations for better messaging on assert failures and
> ++        # errors.
> ++        # FIXME: even in devel, things like `that: item` don't always work properly (truthy string value
> ++        # is not really an embedded expression)
> ++        # we could fix that by doing direct var lookups on the inputs
> ++        # FIXME: some form of this code should probably be shared between debug, assert, and
> ++        # Task.post_validate, since they
> ++        # have a lot of overlapping needs
> ++        try:
> ++            thats = self._task.untemplated_args['that']
> ++        except KeyError:
> ++            # in the case of "we got our entire args dict from a template", we can just consult the
> ++            # post-templated dict (the damage has likely already been done for embedded templates anyway)
> ++            thats = self._task.args['that']
> ++
> ++        # FIXME: this is a case where we only want to resolve indirections, NOT recurse containers
> ++        # (and even then, the leaf-most expression being wrapped is at least suboptimal
> ++        # (since its expression will be "eaten").
> ++        if isinstance(thats, str):
> ++            thats = self._templar.template(thats)
> ++
> +         # make sure the 'that' items are a list
> +-        thats = self._task.args['that']
> +         if not isinstance(thats, list):
> +             thats = [thats]
> +
> +diff --git a/lib/ansible/plugins/callback/__init__.py b/lib/ansible/plugins/callback/__init__.py
> +index d4fc347d03..7646d2939f 100644
> +--- a/lib/ansible/plugins/callback/__init__.py
> ++++ b/lib/ansible/plugins/callback/__init__.py
> +@@ -38,7 +38,7 @@ from ansible.parsing.yaml.objects import AnsibleUnicode
> + from ansible.plugins import AnsiblePlugin
> + from ansible.utils.color import stringc
> + from ansible.utils.display import Display
> +-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, NativeJinjaUnsafeText
> ++from ansible.utils.unsafe_proxy import AnsibleUnsafeText, NativeJinjaUnsafeText, _is_unsafe
> + from ansible.vars.clean import strip_internal_keys, module_response_deepcopy
> +
> + import yaml
> +@@ -113,6 +113,8 @@ def _munge_data_for_lossy_yaml(scalar):
> +
> + def _pretty_represent_str(self, data):
> +     """Uses block style for multi-line strings"""
> ++    if _is_unsafe(data):
> ++        data = data._strip_unsafe()
> +     data = text_type(data)
> +     if _should_use_block(data):
> +         style = '|'
> +diff --git a/lib/ansible/plugins/filter/core.py b/lib/ansible/plugins/filter/core.py
> +index 52a2cd108e..b7e2c11ec8 100644
> +--- a/lib/ansible/plugins/filter/core.py
> ++++ b/lib/ansible/plugins/filter/core.py
> +@@ -37,6 +37,7 @@ from ansible.utils.display import Display
> + from ansible.utils.encrypt import passlib_or_crypt
> + from ansible.utils.hashing import md5s, checksum_s
> + from ansible.utils.unicode import unicode_wrap
> ++from ansible.utils.unsafe_proxy import _is_unsafe
> + from ansible.utils.vars import merge_hash
> +
> + display = Display()
> +@@ -215,6 +216,8 @@ def from_yaml(data):
> +         # The ``text_type`` call here strips any custom
> +         # string wrapper class, so that CSafeLoader can
> +         # read the data
> ++        if _is_unsafe(data):
> ++            data = data._strip_unsafe()
> +         return yaml_load(text_type(to_text(data, errors='surrogate_or_strict')))
> +     return data
> +
> +@@ -224,6 +227,8 @@ def from_yaml_all(data):
> +         # The ``text_type`` call here strips any custom
> +         # string wrapper class, so that CSafeLoader can
> +         # read the data
> ++        if _is_unsafe(data):
> ++            data = data._strip_unsafe()
> +         return yaml_load_all(text_type(to_text(data, errors='surrogate_or_strict')))
> +     return data
> +
> +diff --git a/lib/ansible/plugins/lookup/first_found.py b/lib/ansible/plugins/lookup/first_found.py
> +index 5b94b103a4..a882db017b 100644
> +--- a/lib/ansible/plugins/lookup/first_found.py
> ++++ b/lib/ansible/plugins/lookup/first_found.py
> +@@ -136,7 +136,6 @@ RETURN = """
> +     elements: path
> + """
> + import os
> +-import re
> +
> + from collections.abc import Mapping, Sequence
> +
> +@@ -147,10 +146,22 @@ from ansible.module_utils.six import string_types
> + from ansible.plugins.lookup import LookupBase
> +
> +
> ++def _splitter(value, chars):
> ++    chars = set(chars)
> ++    v = ''
> ++    for c in value:
> ++        if c in chars:
> ++            yield v
> ++            v = ''
> ++            continue
> ++        v += c
> ++    yield v
> ++
> ++
> + def _split_on(terms, spliters=','):
> +     termlist = []
> +     if isinstance(terms, string_types):
> +-        termlist = re.split(r'[%s]' % ''.join(map(re.escape, spliters)), terms)
> ++        termlist = list(_splitter(terms, spliters))
> +     else:
> +         # added since options will already listify
> +         for t in terms:
> +diff --git a/lib/ansible/template/__init__.py b/lib/ansible/template/__init__.py
> +index baa85ed793..c45cfe350e 100644
> +--- a/lib/ansible/template/__init__.py
> ++++ b/lib/ansible/template/__init__.py
> +@@ -31,7 +31,7 @@ from contextlib import contextmanager
> + from numbers import Number
> + from traceback import format_exc
> +
> +-from jinja2.exceptions import TemplateSyntaxError, UndefinedError
> ++from jinja2.exceptions import TemplateSyntaxError, UndefinedError, SecurityError
> + from jinja2.loaders import FileSystemLoader
> + from jinja2.nativetypes import NativeEnvironment
> + from jinja2.runtime import Context, StrictUndefined
> +@@ -55,7 +55,7 @@ from ansible.template.vars import AnsibleJ2Vars
> + from ansible.utils.display import Display
> + from ansible.utils.listify import listify_lookup_plugin_terms
> + from ansible.utils.native_jinja import NativeJinjaText
> +-from ansible.utils.unsafe_proxy import wrap_var
> ++from ansible.utils.unsafe_proxy import wrap_var, AnsibleUnsafeText, AnsibleUnsafeBytes, NativeJinjaUnsafeText
> +
> + display = Display()
> +
> +@@ -332,10 +332,21 @@ class AnsibleContext(Context):
> +     flag is checked post-templating, and (when set) will result in the
> +     final templated result being wrapped in AnsibleUnsafe.
> +     '''
> ++    _disallowed_callables = frozenset({
> ++        AnsibleUnsafeText._strip_unsafe.__qualname__,
> ++        AnsibleUnsafeBytes._strip_unsafe.__qualname__,
> ++        NativeJinjaUnsafeText._strip_unsafe.__qualname__,
> ++    })
> ++
> +     def __init__(self, *args, **kwargs):
> +         super(AnsibleContext, self).__init__(*args, **kwargs)
> +         self.unsafe = False
> +
> ++    def call(self, obj, *args, **kwargs):
> ++        if getattr(obj, '__qualname__', None) in self._disallowed_callables or obj in self._disallowed_callables:
> ++            raise SecurityError(f"{obj!r} is not safely callable")
> ++        return super().call(obj, *args, **kwargs)
> ++
> +     def _is_unsafe(self, val):
> +         '''
> +         Our helper function, which will also recursively check dict and
> +diff --git a/lib/ansible/utils/unsafe_proxy.py b/lib/ansible/utils/unsafe_proxy.py
> +index d78ebf6e8d..7da74dcfb2 100644
> +--- a/lib/ansible/utils/unsafe_proxy.py
> ++++ b/lib/ansible/utils/unsafe_proxy.py
> +@@ -69,15 +69,264 @@ class AnsibleUnsafe(object):
> +
> +
> + class AnsibleUnsafeBytes(binary_type, AnsibleUnsafe):
> +-    def decode(self, *args, **kwargs):
> +-        """Wrapper method to ensure type conversions maintain unsafe context"""
> +-        return AnsibleUnsafeText(super(AnsibleUnsafeBytes, self).decode(*args, **kwargs))
> ++    def _strip_unsafe(self):
> ++        return super().__bytes__()
> ++
> ++    def __str__(self, /):  # pylint: disable=invalid-str-returned
> ++        return self.encode()
> ++
> ++    def __bytes__(self, /):  # pylint: disable=invalid-bytes-returned
> ++        return self
> ++
> ++    def __repr__(self, /):  # pylint: disable=invalid-repr-returned
> ++        return AnsibleUnsafeText(super().__repr__())
> ++
> ++    def __format__(self, format_spec, /):  # pylint: disable=invalid-format-returned
> ++        return self.__class__(super().__format__(format_spec))
> ++
> ++    def __getitem__(self, key, /):
> ++        return self.__class__(super().__getitem__(key))
> ++
> ++    def __iter__(self, /):
> ++        cls = self.__class__
> ++        return (cls(c) for c in super().__iter__())
> ++
> ++    def __reversed__(self, /):
> ++        return self[::-1]
> ++
> ++    def __add__(self, value, /):
> ++        return self.__class__(super().__add__(value))
> ++
> ++    def __radd__(self, value, /):
> ++        return self.__class__(value.__add__(self))
> ++
> ++    def __mul__(self, value, /):
> ++        return self.__class__(super().__mul__(value))
> ++
> ++    __rmul__ = __mul__
> ++
> ++    def __mod__(self, value, /):
> ++        return self.__class__(super().__mod__(value))
> ++
> ++    def __rmod__(self, value, /):
> ++        return self.__class__(super().__rmod__(value))
> ++
> ++    def capitalize(self, /):
> ++        return self.__class__(super().capitalize())
> ++
> ++    def casefold(self, /):
> ++        return self.__class__(super().casefold())
> ++
> ++    def center(self, width, fillchar=b' ', /):
> ++        return self.__class__(super().center(width, fillchar))
> ++
> ++    def decode(self, /, encoding='utf-8', errors='strict'):
> ++        return AnsibleUnsafeText(super().decode(encoding=encoding, errors=errors))
> ++
> ++    def removeprefix(self, prefix, /):
> ++        return self.__class__(super().removeprefix(prefix))
> ++
> ++    def removesuffix(self, suffix, /):
> ++        return self.__class__(super().removesuffix(suffix))
> ++
> ++    def expandtabs(self, /, tabsize=8):
> ++        return self.__class__(super().expandtabs(tabsize))
> ++
> ++    def format(self, /, *args, **kwargs):
> ++        return self.__class__(super().format(*args, **kwargs))
> ++
> ++    def format_map(self, mapping, /):
> ++        return self.__class__(super().format_map(mapping))
> ++
> ++    def join(self, iterable_of_bytes, /):
> ++        return self.__class__(super().join(iterable_of_bytes))
> ++
> ++    def ljust(self, width, fillchar=b' ', /):
> ++        return self.__class__(super().ljust(width, fillchar))
> ++
> ++    def lower(self, /):
> ++        return self.__class__(super().lower())
> ++
> ++    def lstrip(self, bytes=None, /):
> ++        return self.__class__(super().lstrip(bytes))
> ++
> ++    def partition(self, sep, /):
> ++        cls = self.__class__
> ++        return tuple(cls(e) for e in super().partition(sep))
> ++
> ++    def replace(self, old, new, count=-1, /):
> ++        return self.__class__(super().replace(old, new, count))
> ++
> ++    def rjust(self, width, fillchar=b' ', /):
> ++        return self.__class__(super().rjust(width, fillchar))
> ++
> ++    def rpartition(self, sep, /):
> ++        cls = self.__class__
> ++        return tuple(cls(e) for e in super().rpartition(sep))
> ++
> ++    def rstrip(self, bytes=None, /):
> ++        return self.__class__(super().rstrip(bytes))
> ++
> ++    def split(self, /, sep=None, maxsplit=-1):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().split(sep=sep, maxsplit=maxsplit)]
> ++
> ++    def rsplit(self, /, sep=None, maxsplit=-1):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().rsplit(sep=sep, maxsplit=maxsplit)]
> ++
> ++    def splitlines(self, /, keepends=False):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().splitlines(keepends=keepends)]
> ++
> ++    def strip(self, bytes=None, /):
> ++        return self.__class__(super().strip(bytes))
> ++
> ++    def swapcase(self, /):
> ++        return self.__class__(super().swapcase())
> ++
> ++    def title(self, /):
> ++        return self.__class__(super().title())
> ++
> ++    def translate(self, table, /, delete=b''):
> ++        return self.__class__(super().translate(table, delete=delete))
> ++
> ++    def upper(self, /):
> ++        return self.__class__(super().upper())
> ++
> ++    def zfill(self, width, /):
> ++        return self.__class__(super().zfill(width))
> +
> +
> + class AnsibleUnsafeText(text_type, AnsibleUnsafe):
> +-    def encode(self, *args, **kwargs):
> +-        """Wrapper method to ensure type conversions maintain unsafe context"""
> +-        return AnsibleUnsafeBytes(super(AnsibleUnsafeText, self).encode(*args, **kwargs))
> ++    # def __getattribute__(self, name):
> ++    #     print(f'attr: {name}')
> ++    #     return object.__getattribute__(self, name)
> ++
> ++    def _strip_unsafe(self, /):
> ++        return super().__str__()
> ++
> ++    def __str__(self, /):  # pylint: disable=invalid-str-returned
> ++        return self
> ++
> ++    def __repr__(self, /):  # pylint: disable=invalid-repr-returned
> ++        return self.__class__(super().__repr__())
> ++
> ++    def __format__(self, format_spec, /):  # pylint: disable=invalid-format-returned
> ++        return self.__class__(super().__format__(format_spec))
> ++
> ++    def __getitem__(self, key, /):
> ++        return self.__class__(super().__getitem__(key))
> ++
> ++    def __iter__(self, /):
> ++        cls = self.__class__
> ++        return (cls(c) for c in super().__iter__())
> ++
> ++    def __reversed__(self, /):
> ++        return self[::-1]
> ++
> ++    def __add__(self, value, /):
> ++        return self.__class__(super().__add__(value))
> ++
> ++    def __radd__(self, value, /):
> ++        return self.__class__(value.__add__(self))
> ++
> ++    def __mul__(self, value, /):
> ++        return self.__class__(super().__mul__(value))
> ++
> ++    __rmul__ = __mul__
> ++
> ++    def __mod__(self, value, /):
> ++        return self.__class__(super().__mod__(value))
> ++
> ++    def __rmod__(self, value, /):
> ++        return self.__class__(super().__rmod__(value))
> ++
> ++    def capitalize(self, /):
> ++        return self.__class__(super().capitalize())
> ++
> ++    def casefold(self, /):
> ++        return self.__class__(super().casefold())
> ++
> ++    def center(self, width, fillchar=' ', /):
> ++        return self.__class__(super().center(width, fillchar))
> ++
> ++    def encode(self, /, encoding='utf-8', errors='strict'):
> ++        return AnsibleUnsafeBytes(super().encode(encoding=encoding, errors=errors))
> ++
> ++    def removeprefix(self, prefix, /):
> ++        return self.__class__(super().removeprefix(prefix))
> ++
> ++    def removesuffix(self, suffix, /):
> ++        return self.__class__(super().removesuffix(suffix))
> ++
> ++    def expandtabs(self, /, tabsize=8):
> ++        return self.__class__(super().expandtabs(tabsize))
> ++
> ++    def format(self, /, *args, **kwargs):
> ++        return self.__class__(super().format(*args, **kwargs))
> ++
> ++    def format_map(self, mapping, /):
> ++        return self.__class__(super().format_map(mapping))
> ++
> ++    def join(self, iterable, /):
> ++        return self.__class__(super().join(iterable))
> ++
> ++    def ljust(self, width, fillchar=' ', /):
> ++        return self.__class__(super().ljust(width, fillchar))
> ++
> ++    def lower(self, /):
> ++        return self.__class__(super().lower())
> ++
> ++    def lstrip(self, chars=None, /):
> ++        return self.__class__(super().lstrip(chars))
> ++
> ++    def partition(self, sep, /):
> ++        cls = self.__class__
> ++        return tuple(cls(e) for e in super().partition(sep))
> ++
> ++    def replace(self, old, new, count=-1, /):
> ++        return self.__class__(super().replace(old, new, count))
> ++
> ++    def rjust(self, width, fillchar=' ', /):
> ++        return self.__class__(super().rjust(width, fillchar))
> ++
> ++    def rpartition(self, sep, /):
> ++        cls = self.__class__
> ++        return tuple(cls(e) for e in super().rpartition(sep))
> ++
> ++    def rstrip(self, chars=None, /):
> ++        return self.__class__(super().rstrip(chars))
> ++
> ++    def split(self, /, sep=None, maxsplit=-1):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().split(sep=sep, maxsplit=maxsplit)]
> ++
> ++    def rsplit(self, /, sep=None, maxsplit=-1):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().rsplit(sep=sep, maxsplit=maxsplit)]
> ++
> ++    def splitlines(self, /, keepends=False):
> ++        cls = self.__class__
> ++        return [cls(e) for e in super().splitlines(keepends=keepends)]
> ++
> ++    def strip(self, chars=None, /):
> ++        return self.__class__(super().strip(chars))
> ++
> ++    def swapcase(self, /):
> ++        return self.__class__(super().swapcase())
> ++
> ++    def title(self, /):
> ++        return self.__class__(super().title())
> ++
> ++    def translate(self, table, /):
> ++        return self.__class__(super().translate(table))
> ++
> ++    def upper(self, /):
> ++        return self.__class__(super().upper())
> ++
> ++    def zfill(self, width, /):
> ++        return self.__class__(super().zfill(width))
> +
> +
> + class NativeJinjaUnsafeText(NativeJinjaText, AnsibleUnsafeText):
> +@@ -126,3 +375,7 @@ def to_unsafe_bytes(*args, **kwargs):
> +
> + def to_unsafe_text(*args, **kwargs):
> +     return wrap_var(to_text(*args, **kwargs))
> ++
> ++
> ++def _is_unsafe(obj):
> ++    return getattr(obj, '__UNSAFE__', False) is True
> +diff --git a/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_dependency_deduplication.yml b/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_dependency_deduplication.yml
> +index f200be1803..e084752494 100644
> +--- a/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_dependency_deduplication.yml
> ++++ b/test/integration/targets/ansible-galaxy-collection-scm/tasks/scm_dependency_deduplication.yml
> +@@ -13,22 +13,22 @@
> +         in command.stdout_lines
> +       - >-
> +         "Installing 'namespace_1.collection_1:1.0.0' to
> +-        '{{ install_path }}/namespace_1/collection_1'"
> ++        '" ~ install_path ~ "/namespace_1/collection_1'"
> +         in command.stdout_lines
> +       - >-
> +         'Created collection for namespace_1.collection_1:1.0.0 at
> +-        {{ install_path }}/namespace_1/collection_1'
> ++        ' ~ install_path ~ '/namespace_1/collection_1'
> +         in command.stdout_lines
> +       - >-
> +         'namespace_1.collection_1:1.0.0 was installed successfully'
> +         in command.stdout_lines
> +       - >-
> +         "Installing 'namespace_2.collection_2:1.0.0' to
> +-        '{{ install_path }}/namespace_2/collection_2'"
> ++        '" ~ install_path ~ "/namespace_2/collection_2'"
> +         in command.stdout_lines
> +       - >-
> +         'Created collection for namespace_2.collection_2:1.0.0 at
> +-        {{ install_path }}/namespace_2/collection_2'
> ++        ' ~ install_path ~ '/namespace_2/collection_2'
> +         in command.stdout_lines
> +       - >-
> +         'namespace_2.collection_2:1.0.0 was installed successfully'
> +@@ -58,22 +58,22 @@
> +         in command.stdout_lines
> +       - >-
> +         "Installing 'namespace_1.collection_1:1.0.0' to
> +-        '{{ install_path }}/namespace_1/collection_1'"
> ++        '" ~ install_path ~ "/namespace_1/collection_1'"
> +         in command.stdout_lines
> +       - >-
> +         'Created collection for namespace_1.collection_1:1.0.0 at
> +-        {{ install_path }}/namespace_1/collection_1'
> ++        ' ~ install_path ~ '/namespace_1/collection_1'
> +         in command.stdout_lines
> +       - >-
> +         'namespace_1.collection_1:1.0.0 was installed successfully'
> +         in command.stdout_lines
> +       - >-
> +         "Installing 'namespace_2.collection_2:1.0.0' to
> +-        '{{ install_path }}/namespace_2/collection_2'"
> ++        '" ~ install_path ~ "/namespace_2/collection_2'"
> +         in command.stdout_lines
> +       - >-
> +         'Created collection for namespace_2.collection_2:1.0.0 at
> +-        {{ install_path }}/namespace_2/collection_2'
> ++        ' ~ install_path ~ '/namespace_2/collection_2'
> +         in command.stdout_lines
> +       - >-
> +         'namespace_2.collection_2:1.0.0 was installed successfully'
> +diff --git a/test/integration/targets/ansible-vault/roles/test_vault_embedded/tasks/main.yml b/test/integration/targets/ansible-vault/roles/test_vault_embedded/tasks/main.yml
> +index eba938966d..98ef751b86 100644
> +--- a/test/integration/targets/ansible-vault/roles/test_vault_embedded/tasks/main.yml
> ++++ b/test/integration/targets/ansible-vault/roles/test_vault_embedded/tasks/main.yml
> +@@ -2,7 +2,7 @@
> + - name: Assert that a embedded vault of a string with no newline works
> +   assert:
> +     that:
> +-      - '"{{ vault_encrypted_one_line_var }}" == "Setec Astronomy"'
> ++      - 'vault_encrypted_one_line_var == "Setec Astronomy"'
> +
> + - name: Assert that a multi line embedded vault works, including new line
> +   assert:
> +diff --git a/test/integration/targets/ansible-vault/roles/test_vault_file_encrypted_embedded/tasks/main.yml b/test/integration/targets/ansible-vault/roles/test_vault_file_encrypted_embedded/tasks/main.yml
> +index e09004a1d9..107e65cb11 100644
> +--- a/test/integration/targets/ansible-vault/roles/test_vault_file_encrypted_embedded/tasks/main.yml
> ++++ b/test/integration/targets/ansible-vault/roles/test_vault_file_encrypted_embedded/tasks/main.yml
> +@@ -2,7 +2,7 @@
> + - name: Assert that a vault encrypted file with embedded vault of a string with no newline works
> +   assert:
> +     that:
> +-      - '"{{ vault_file_encrypted_with_encrypted_one_line_var }}" == "Setec Astronomy"'
> ++      - 'vault_file_encrypted_with_encrypted_one_line_var == "Setec Astronomy"'
> +
> + - name: Assert that a vault encrypted file with multi line embedded vault works, including new line
> +   assert:
> +diff --git a/test/integration/targets/apt_repository/tasks/apt.yml b/test/integration/targets/apt_repository/tasks/apt.yml
> +index 0dc25afd59..9c15e64765 100644
> +--- a/test/integration/targets/apt_repository/tasks/apt.yml
> ++++ b/test/integration/targets/apt_repository/tasks/apt.yml
> +@@ -50,7 +50,7 @@
> +     that:
> +       - 'result.changed'
> +       - 'result.state == "present"'
> +-      - 'result.repo == "{{test_ppa_name}}"'
> ++      - 'result.repo == test_ppa_name'
> +
> + - name: 'examine apt cache mtime'
> +   stat: path='/var/cache/apt/pkgcache.bin'
> +@@ -81,7 +81,7 @@
> +     that:
> +       - 'result.changed'
> +       - 'result.state == "present"'
> +-      - 'result.repo == "{{test_ppa_name}}"'
> ++      - 'result.repo == test_ppa_name'
> +
> + - name: 'examine apt cache mtime'
> +   stat: path='/var/cache/apt/pkgcache.bin'
> +@@ -112,7 +112,7 @@
> +     that:
> +       - 'result.changed'
> +       - 'result.state == "present"'
> +-      - 'result.repo == "{{test_ppa_name}}"'
> ++      - 'result.repo == test_ppa_name'
> +
> + - name: 'examine apt cache mtime'
> +   stat: path='/var/cache/apt/pkgcache.bin'
> +@@ -151,7 +151,7 @@
> +     that:
> +       - 'result.changed'
> +       - 'result.state == "present"'
> +-      - 'result.repo == "{{test_ppa_spec}}"'
> ++      - 'result.repo == test_ppa_spec'
> +       - result_cache is not changed
> +
> + - name: 'examine apt cache mtime'
> +@@ -191,7 +191,7 @@
> +     that:
> +       - 'result.changed'
> +       - 'result.state == "present"'
> +-      - 'result.repo == "{{test_ppa_spec}}"'
> ++      - 'result.repo == test_ppa_spec'
> +
> + - name: 'examine source file'
> +   stat: path='/etc/apt/sources.list.d/{{test_ppa_filename}}.list'
> +diff --git a/test/integration/targets/assert/assert.out.nested_tmpl.stderr b/test/integration/targets/assert/assert.out.nested_tmpl.stderr
> +new file mode 100644
> +index 0000000000..ea208a41c7
> +--- /dev/null
> ++++ b/test/integration/targets/assert/assert.out.nested_tmpl.stderr
> +@@ -0,0 +1,4 @@
> +++ ansible-playbook -i localhost, -c local nested_tmpl.yml
> ++++ set +x
> ++[WARNING]: conditional statements should not include jinja2 templating
> ++delimiters such as {{ }} or {% %}. Found: "{{ foo }}" == "bar"
> +diff --git a/test/integration/targets/assert/assert.out.nested_tmpl.stdout b/test/integration/targets/assert/assert.out.nested_tmpl.stdout
> +new file mode 100644
> +index 0000000000..8ca3fb76d4
> +--- /dev/null
> ++++ b/test/integration/targets/assert/assert.out.nested_tmpl.stdout
> +@@ -0,0 +1,12 @@
> ++
> ++PLAY [localhost] ***************************************************************
> ++
> ++TASK [assert] ******************************************************************
> ++ok: [localhost] => {
> ++    "changed": false,
> ++    "msg": "All assertions passed"
> ++}
> ++
> ++PLAY RECAP *********************************************************************
> ++localhost                  : ok=1    changed=0    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0
> ++
> +diff --git a/test/integration/targets/assert/assert_quiet.out.quiet.stderr b/test/integration/targets/assert/assert.out.quiet.stderr
> +similarity index 100%
> +rename from test/integration/targets/assert/assert_quiet.out.quiet.stderr
> +rename to test/integration/targets/assert/assert.out.quiet.stderr
> +diff --git a/test/integration/targets/assert/assert_quiet.out.quiet.stdout b/test/integration/targets/assert/assert.out.quiet.stdout
> +similarity index 100%
> +rename from test/integration/targets/assert/assert_quiet.out.quiet.stdout
> +rename to test/integration/targets/assert/assert.out.quiet.stdout
> +diff --git a/test/integration/targets/assert/nested_tmpl.yml b/test/integration/targets/assert/nested_tmpl.yml
> +new file mode 100644
> +index 0000000000..3da4b1d80e
> +--- /dev/null
> ++++ b/test/integration/targets/assert/nested_tmpl.yml
> +@@ -0,0 +1,9 @@
> ++- hosts: localhost
> ++  gather_facts: False
> ++  tasks:
> ++    - assert:
> ++        that:
> ++          - '"{{ foo }}" == "bar"'
> ++          - foo == "bar"
> ++      vars:
> ++        foo: bar
> +diff --git a/test/integration/targets/assert/quiet.yml b/test/integration/targets/assert/quiet.yml
> +index 6834712c2c..1c425cb5ba 100644
> +--- a/test/integration/targets/assert/quiet.yml
> ++++ b/test/integration/targets/assert/quiet.yml
> +@@ -5,12 +5,12 @@
> +     item_A: yes
> +   tasks:
> +   - assert:
> +-      that: "{{ item }} is defined"
> ++      that: "item is defined"
> +       quiet: True
> +     with_items:
> +       - item_A
> +   - assert:
> +-      that: "{{ item }} is defined"
> ++      that: "item is defined"
> +       quiet: False
> +     with_items:
> +       - item_A
> +diff --git a/test/integration/targets/assert/runme.sh b/test/integration/targets/assert/runme.sh
> +index ca0a858726..b79072813d 100755
> +--- a/test/integration/targets/assert/runme.sh
> ++++ b/test/integration/targets/assert/runme.sh
> +@@ -45,7 +45,7 @@ cleanup() {
> +    fi
> + }
> +
> +-BASEFILE=assert_quiet.out
> ++BASEFILE=assert.out
> +
> + ORIGFILE="${BASEFILE}"
> + OUTFILE="${BASEFILE}.new"
> +@@ -69,3 +69,4 @@ export ANSIBLE_NOCOLOR=1
> + export ANSIBLE_RETRY_FILES_ENABLED=0
> +
> + run_test quiet
> ++run_test nested_tmpl
> +diff --git a/test/integration/targets/command_shell/tasks/main.yml b/test/integration/targets/command_shell/tasks/main.yml
> +index 12a944c48c..1f4aa5d75e 100644
> +--- a/test/integration/targets/command_shell/tasks/main.yml
> ++++ b/test/integration/targets/command_shell/tasks/main.yml
> +@@ -296,7 +296,7 @@
> +   assert:
> +     that:
> +     - shell_result0 is changed
> +-    - shell_result0.cmd == '{{ remote_tmp_dir_test }}/test.sh'
> ++    - shell_result0.cmd == remote_tmp_dir_test ~ '/test.sh'
> +     - shell_result0.rc == 0
> +     - shell_result0.stderr == ''
> +     - shell_result0.stdout == 'win'
> +diff --git a/test/integration/targets/copy/tasks/tests.yml b/test/integration/targets/copy/tasks/tests.yml
> +index 7220356332..d6c8e63c9a 100644
> +--- a/test/integration/targets/copy/tasks/tests.yml
> ++++ b/test/integration/targets/copy/tasks/tests.yml
> +@@ -1176,7 +1176,7 @@
> +   assert:
> +     that:
> +       - "copy_result6.changed"
> +-      - "copy_result6.dest == '{{remote_dir_expanded}}/multiline.txt'"
> ++      - "copy_result6.dest == remote_dir_expanded ~ '/multiline.txt'"
> +       - "copy_result6.checksum == '9cd0697c6a9ff6689f0afb9136fa62e0b3fee903'"
> +
> + # test overwriting a file as an unprivileged user (pull request #8624)
> +@@ -2079,26 +2079,26 @@
> +     assert:
> +       that:
> +       - testcase5 is changed
> +-      - "stat_new_dir_with_chown.stat.uid == {{ ansible_copy_test_user.uid }}"
> +-      - "stat_new_dir_with_chown.stat.gid == {{ ansible_copy_test_group.gid }}"
> +-      - "stat_new_dir_with_chown.stat.pw_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown.stat.gr_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_file1.stat.uid == {{ ansible_copy_test_user.uid }}"
> +-      - "stat_new_dir_with_chown_file1.stat.gid == {{ ansible_copy_test_group.gid }}"
> +-      - "stat_new_dir_with_chown_file1.stat.pw_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_file1.stat.gr_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_subdir.stat.uid == {{ ansible_copy_test_user.uid }}"
> +-      - "stat_new_dir_with_chown_subdir.stat.gid == {{ ansible_copy_test_group.gid }}"
> +-      - "stat_new_dir_with_chown_subdir.stat.pw_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_subdir.stat.gr_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_subdir_file12.stat.uid == {{ ansible_copy_test_user.uid }}"
> +-      - "stat_new_dir_with_chown_subdir_file12.stat.gid == {{ ansible_copy_test_group.gid }}"
> +-      - "stat_new_dir_with_chown_subdir_file12.stat.pw_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_subdir_file12.stat.gr_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_link_file12.stat.uid == {{ ansible_copy_test_user.uid }}"
> +-      - "stat_new_dir_with_chown_link_file12.stat.gid == {{ ansible_copy_test_group.gid }}"
> +-      - "stat_new_dir_with_chown_link_file12.stat.pw_name == '{{ ansible_copy_test_user_name }}'"
> +-      - "stat_new_dir_with_chown_link_file12.stat.gr_name == '{{ ansible_copy_test_user_name }}'"
> ++      - "stat_new_dir_with_chown.stat.uid == ansible_copy_test_user.uid"
> ++      - "stat_new_dir_with_chown.stat.gid == ansible_copy_test_group.gid"
> ++      - "stat_new_dir_with_chown.stat.pw_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown.stat.gr_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_file1.stat.uid == ansible_copy_test_user.uid"
> ++      - "stat_new_dir_with_chown_file1.stat.gid == ansible_copy_test_group.gid"
> ++      - "stat_new_dir_with_chown_file1.stat.pw_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_file1.stat.gr_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_subdir.stat.uid == ansible_copy_test_user.uid"
> ++      - "stat_new_dir_with_chown_subdir.stat.gid == ansible_copy_test_group.gid"
> ++      - "stat_new_dir_with_chown_subdir.stat.pw_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_subdir.stat.gr_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_subdir_file12.stat.uid == ansible_copy_test_user.uid"
> ++      - "stat_new_dir_with_chown_subdir_file12.stat.gid == ansible_copy_test_group.gid"
> ++      - "stat_new_dir_with_chown_subdir_file12.stat.pw_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_subdir_file12.stat.gr_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_link_file12.stat.uid == ansible_copy_test_user.uid"
> ++      - "stat_new_dir_with_chown_link_file12.stat.gid == ansible_copy_test_group.gid"
> ++      - "stat_new_dir_with_chown_link_file12.stat.pw_name == ansible_copy_test_user_name"
> ++      - "stat_new_dir_with_chown_link_file12.stat.gr_name == ansible_copy_test_user_name"
> +
> +   always:
> +     - name: execute - remove the user for test
> +diff --git a/test/integration/targets/debug/runme.sh b/test/integration/targets/debug/runme.sh
> +index 5faeb782a6..dc02859d35 100755
> +--- a/test/integration/targets/debug/runme.sh
> ++++ b/test/integration/targets/debug/runme.sh
> +@@ -18,3 +18,5 @@ done
> +
> + # ensure debug does not set top level vars when looking at ansible_facts
> + ansible-playbook nosetfacts.yml "$@"
> ++
> ++ansible-playbook unsafe.yml "$@"
> +diff --git a/test/integration/targets/debug/unsafe.yml b/test/integration/targets/debug/unsafe.yml
> +new file mode 100644
> +index 0000000000..6a78af1a69
> +--- /dev/null
> ++++ b/test/integration/targets/debug/unsafe.yml
> +@@ -0,0 +1,13 @@
> ++- hosts: localhost
> ++  gather_facts: false
> ++  vars:
> ++    unsafe_var: !unsafe undef()|mandatory
> ++  tasks:
> ++    - debug:
> ++        var: '{{ unsafe_var }}'
> ++      ignore_errors: true
> ++      register: result
> ++
> ++    - assert:
> ++        that:
> ++          - result is successful
> +diff --git a/test/integration/targets/dnf/tasks/test_sos_removal.yml b/test/integration/targets/dnf/tasks/test_sos_removal.yml
> +index 40ceb62bf4..0d70cf7877 100644
> +--- a/test/integration/targets/dnf/tasks/test_sos_removal.yml
> ++++ b/test/integration/targets/dnf/tasks/test_sos_removal.yml
> +@@ -15,5 +15,5 @@
> +     that:
> +       - sos_rm is successful
> +       - sos_rm is changed
> +-      - "'Removed: sos-{{ sos_version }}-{{ sos_release }}' in sos_rm.results[0]"
> ++      - "'Removed: sos-' ~ sos_version ~ '-' ~ sos_release in sos_rm.results[0]"
> +       - sos_rm.results|length == 1
> +diff --git a/test/integration/targets/expect/tasks/main.yml b/test/integration/targets/expect/tasks/main.yml
> +index d6f43f2c6a..7bf18c5e5c 100644
> +--- a/test/integration/targets/expect/tasks/main.yml
> ++++ b/test/integration/targets/expect/tasks/main.yml
> +@@ -117,7 +117,7 @@
> + - name: assert chdir works
> +   assert:
> +     that:
> +-    - "'{{chdir_result.stdout | trim}}' == '{{remote_tmp_dir_real_path.stdout | trim}}'"
> ++    - "chdir_result.stdout | trim == remote_tmp_dir_real_path.stdout | trim"
> +
> + - name: test timeout option
> +   expect:
> +diff --git a/test/integration/targets/file/tasks/main.yml b/test/integration/targets/file/tasks/main.yml
> +index 17b0fae68a..a5bd68d768 100644
> +--- a/test/integration/targets/file/tasks/main.yml
> ++++ b/test/integration/targets/file/tasks/main.yml
> +@@ -927,7 +927,7 @@
> +     that:
> +       - "file_error3 is failed"
> +       - "file_error3.msg == 'src does not exist'"
> +-      - "file_error3.dest == '{{ remote_tmp_dir_test }}/hard.txt' | expanduser"
> ++      - "file_error3.dest == remote_tmp_dir_test | expanduser ~ '/hard.txt'"
> +       - "file_error3.src == 'non-existing-file-that-does-not-exist.txt'"
> +
> + - block:
> +diff --git a/test/integration/targets/file/tasks/state_link.yml b/test/integration/targets/file/tasks/state_link.yml
> +index 673fe6fd52..6f96cdcba9 100644
> +--- a/test/integration/targets/file/tasks/state_link.yml
> ++++ b/test/integration/targets/file/tasks/state_link.yml
> +@@ -199,7 +199,7 @@
> +       - "missing_dst_no_follow_enable_force_use_mode2 is changed"
> +       - "missing_dst_no_follow_enable_force_use_mode3 is not changed"
> +       - "soft3_result['stat'].islnk"
> +-      - "soft3_result['stat'].lnk_target == '{{ user.home�}}/nonexistent'"
> ++      - "soft3_result['stat'].lnk_target == user.home�~ '/nonexistent'"
> +
> + #
> + # Test creating a link to a directory https://github.com/ansible/ansible/issues/1369
> +diff --git a/test/integration/targets/find/tasks/main.yml b/test/integration/targets/find/tasks/main.yml
> +index 5381a14478..89c62b9b6f 100644
> +--- a/test/integration/targets/find/tasks/main.yml
> ++++ b/test/integration/targets/find/tasks/main.yml
> +@@ -267,7 +267,7 @@
> + - name: assert we skipped the ogg file
> +   assert:
> +     that:
> +-      - '"{{ remote_tmp_dir_test }}/e/f/g/h/8.ogg" not in find_test3_list'
> ++      - 'remote_tmp_dir_test ~ "/e/f/g/h/8.ogg" not in find_test3_list'
> +
> + - name: patterns with regex
> +   find:
> +@@ -317,7 +317,7 @@
> +   assert:
> +     that:
> +       - result.matched == 1
> +-      - '"{{ remote_tmp_dir_test }}/astest/old.txt" in astest_list'
> ++      - 'remote_tmp_dir_test ~ "/astest/old.txt" in astest_list'
> +
> + - name: find files newer than 1 week
> +   find:
> +@@ -332,7 +332,7 @@
> +   assert:
> +     that:
> +       - result.matched == 1
> +-      - '"{{ remote_tmp_dir_test }}/astest/new.txt" in astest_list'
> ++      - 'remote_tmp_dir_test ~ "/astest/new.txt" in astest_list'
> +
> + - name: add some content to the new file
> +   shell: "echo hello world > {{ remote_tmp_dir_test }}/astest/new.txt"
> +@@ -352,7 +352,7 @@
> +   assert:
> +     that:
> +       - result.matched == 1
> +-      - '"{{ remote_tmp_dir_test }}/astest/new.txt" in astest_list'
> ++      - 'remote_tmp_dir_test ~ "/astest/new.txt" in astest_list'
> +       - '"checksum" in result.files[0]'
> +
> + - name: find ANY item with LESS than 5 bytes, also get checksums
> +@@ -371,6 +371,6 @@
> +   assert:
> +     that:
> +       - result.matched == 2
> +-      - '"{{ remote_tmp_dir_test }}/astest/old.txt" in astest_list'
> +-      - '"{{ remote_tmp_dir_test }}/astest/.hidden.txt" in astest_list'
> ++      - 'remote_tmp_dir_test ~ "/astest/old.txt" in astest_list'
> ++      - 'remote_tmp_dir_test ~ "/astest/.hidden.txt" in astest_list'
> +       - '"checksum" in result.files[0]'
> +diff --git a/test/integration/targets/gathering_facts/test_gathering_facts.yml b/test/integration/targets/gathering_facts/test_gathering_facts.yml
> +index 47027e8717..faa187b73e 100644
> +--- a/test/integration/targets/gathering_facts/test_gathering_facts.yml
> ++++ b/test/integration/targets/gathering_facts/test_gathering_facts.yml
> +@@ -433,7 +433,7 @@
> +     - name: Test reading facts from default fact_path
> +       assert:
> +         that:
> +-          - '"{{ ansible_local.testfact.fact_dir }}" == "default"'
> ++          - 'ansible_local.testfact.fact_dir == "default"'
> +
> + - hosts: facthost9
> +   tags: [ 'fact_local']
> +@@ -444,7 +444,7 @@
> +     - name: Test reading facts from custom fact_path
> +       assert:
> +         that:
> +-          - '"{{ ansible_local.testfact.fact_dir }}" == "custom"'
> ++          - 'ansible_local.testfact.fact_dir == "custom"'
> +
> + - hosts: facthost20
> +   tags: [ 'fact_facter_ohai' ]
> +diff --git a/test/integration/targets/git/tasks/depth.yml b/test/integration/targets/git/tasks/depth.yml
> +index 547f84f7b5..e0585ca39b 100644
> +--- a/test/integration/targets/git/tasks/depth.yml
> ++++ b/test/integration/targets/git/tasks/depth.yml
> +@@ -169,7 +169,7 @@
> + - name: DEPTH | check update arrived
> +   assert:
> +     that:
> +-      - "{{ a_file.content | b64decode | trim }} == 3"
> ++      - a_file.content | b64decode | trim == "3"
> +       - git_fetch is changed
> +
> + - name: DEPTH | clear checkout_dir
> +diff --git a/test/integration/targets/git/tasks/localmods.yml b/test/integration/targets/git/tasks/localmods.yml
> +index 09a1326d58..0e0cf684ed 100644
> +--- a/test/integration/targets/git/tasks/localmods.yml
> ++++ b/test/integration/targets/git/tasks/localmods.yml
> +@@ -47,7 +47,7 @@
> + - name: LOCALMODS | check update arrived
> +   assert:
> +     that:
> +-      - "{{ a_file.content | b64decode | trim }} == 2"
> ++      - a_file.content | b64decode | trim == "2"
> +       - git_fetch_force is changed
> +
> + - name: LOCALMODS | clear checkout_dir
> +@@ -105,7 +105,7 @@
> + - name: LOCALMODS | check update arrived
> +   assert:
> +     that:
> +-      - "{{ a_file.content | b64decode | trim }} == 2"
> ++      - a_file.content | b64decode | trim == "2"
> +       - git_fetch_force is changed
> +
> + - name: LOCALMODS | clear checkout_dir
> +diff --git a/test/integration/targets/git/tasks/submodules.yml b/test/integration/targets/git/tasks/submodules.yml
> +index 0b311e7984..b6b02490b4 100644
> +--- a/test/integration/targets/git/tasks/submodules.yml
> ++++ b/test/integration/targets/git/tasks/submodules.yml
> +@@ -32,7 +32,7 @@
> +
> + - name: SUBMODULES | Ensure submodu1 is at the appropriate commit
> +   assert:
> +-    that: '{{ submodule1.stdout_lines | length }} == 2'
> ++    that: 'submodule1.stdout_lines | length == 2'
> +
> + - name: SUBMODULES | clear checkout_dir
> +   file:
> +@@ -53,7 +53,7 @@
> +
> + - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
> +   assert:
> +-    that: '{{ submodule1.stdout_lines | length }} == 4'
> ++    that: 'submodule1.stdout_lines | length == 4'
> +
> + - name: SUBMODULES | Copy the checkout so we can run several different tests on it
> +   command: 'cp -pr {{ checkout_dir }} {{ checkout_dir }}.bak'
> +@@ -84,8 +84,8 @@
> + - name: SUBMODULES | Ensure both submodules are at the appropriate commit
> +   assert:
> +     that:
> +-      - '{{ submodule1.stdout_lines|length }} == 4'
> +-      - '{{ submodule2.stdout_lines|length }} == 2'
> ++      - 'submodule1.stdout_lines|length == 4'
> ++      - 'submodule2.stdout_lines|length == 2'
> +
> +
> + - name: SUBMODULES | Remove checkout dir
> +@@ -112,7 +112,7 @@
> +
> + - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
> +   assert:
> +-    that: '{{ submodule1.stdout_lines | length }} == 5'
> ++    that: 'submodule1.stdout_lines | length == 5'
> +
> +
> + - name: SUBMODULES | Test that update with recursive found new submodules
> +@@ -121,7 +121,7 @@
> +
> + - name: SUBMODULES | Enusre submodule2 is at the appropriate commit
> +   assert:
> +-    that: '{{ submodule2.stdout_lines | length }} == 4'
> ++    that: 'submodule2.stdout_lines | length == 4'
> +
> + - name: SUBMODULES | clear checkout_dir
> +   file:
> +@@ -147,4 +147,4 @@
> +
> + - name: SUBMODULES | Ensure submodule1 is at the appropriate commit
> +   assert:
> +-    that: '{{ submodule1.stdout_lines | length }} == 4'
> ++    that: 'submodule1.stdout_lines | length == 4'
> +diff --git a/test/integration/targets/incidental_vyos_config/tests/cli/check_config.yaml b/test/integration/targets/incidental_vyos_config/tests/cli/check_config.yaml
> +index f1ddc71b2c..e45331a148 100644
> +--- a/test/integration/targets/incidental_vyos_config/tests/cli/check_config.yaml
> ++++ b/test/integration/targets/incidental_vyos_config/tests/cli/check_config.yaml
> +@@ -22,7 +22,7 @@
> + - name: Check that multiple duplicate lines collapse into a single commands
> +   assert:
> +     that:
> +-      - "{{ result.commands|length }} == 1"
> ++      - "result.commands|length == 1"
> +
> + - name: Check that set is correctly prepended
> +   assert:
> +@@ -58,6 +58,6 @@
> +
> + - assert:
> +     that:
> +-      - "{{ result.filtered|length }} == 2"
> ++      - "result.filtered|length == 2"
> +
> + - debug: msg="END cli/config_check.yaml on connection={{ ansible_connection }}"
> +diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/deleted.yaml b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/deleted.yaml
> +index 7b2d53a340..316e91c43d 100644
> +--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/deleted.yaml
> ++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/deleted.yaml
> +@@ -16,17 +16,17 @@
> +     - name: Assert that the before dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ populate | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "populate | symmetric_difference(result['before']) |length == 0"
> +
> +     - name: Assert that the correct set of commands were generated
> +       assert:
> +         that:
> +-          - "{{ deleted['commands'] | symmetric_difference(result['commands']) |length == 0 }}"
> ++          - "deleted['commands'] | symmetric_difference(result['commands']) |length == 0"
> +
> +     - name: Assert that the after dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ deleted['after'] | symmetric_difference(result['after']) |length == 0 }}"
> ++          - "deleted['after'] | symmetric_difference(result['after']) |length == 0"
> +
> +     - name: Delete attributes of given interfaces (IDEMPOTENT)
> +       vyos.vyos.vyos_lldp_interfaces: *deleted
> +@@ -41,6 +41,6 @@
> +     - name: Assert that the before dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ deleted['after'] | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "deleted['after'] | symmetric_difference(result['before']) |length == 0"
> +   always:
> +     - include_tasks: _remove_config.yaml
> +diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/merged.yaml b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/merged.yaml
> +index bf968b21de..7e0bb53d33 100644
> +--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/merged.yaml
> ++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/merged.yaml
> +@@ -28,17 +28,17 @@
> +
> +     - name: Assert that before dicts were correctly generated
> +       assert:
> +-        that: "{{ merged['before'] | symmetric_difference(result['before']) |length == 0 }}"
> ++        that: "merged['before'] | symmetric_difference(result['before']) |length == 0"
> +
> +     - name: Assert that correct set of commands were generated
> +       assert:
> +         that:
> +-          - "{{ merged['commands'] | symmetric_difference(result['commands']) |length == 0 }}"
> ++          - "merged['commands'] | symmetric_difference(result['commands']) |length == 0"
> +
> +     - name: Assert that after dicts was correctly generated
> +       assert:
> +         that:
> +-          - "{{ merged['after'] | symmetric_difference(result['after']) |length == 0 }}"
> ++          - "merged['after'] | symmetric_difference(result['after']) |length == 0"
> +
> +     - name: Merge the provided configuration with the existing running configuration (IDEMPOTENT)
> +       vyos.vyos.vyos_lldp_interfaces: *merged
> +@@ -52,7 +52,7 @@
> +     - name: Assert that before dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ merged['after'] | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "merged['after'] | symmetric_difference(result['before']) |length == 0"
> +
> +   always:
> +     - include_tasks: _remove_config.yaml
> +diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/overridden.yaml b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/overridden.yaml
> +index 8cf038c91b..ad13f39328 100644
> +--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/overridden.yaml
> ++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/overridden.yaml
> +@@ -19,17 +19,17 @@
> +     - name: Assert that before dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ populate_intf | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "populate_intf | symmetric_difference(result['before']) |length == 0"
> +
> +     - name: Assert that correct commands were generated
> +       assert:
> +         that:
> +-          - "{{ overridden['commands'] | symmetric_difference(result['commands']) |length == 0 }}"
> ++          - "overridden['commands'] | symmetric_difference(result['commands']) |length == 0"
> +
> +     - name: Assert that after dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ overridden['after'] | symmetric_difference(result['after']) |length == 0 }}"
> ++          - "overridden['after'] | symmetric_difference(result['after']) |length == 0"
> +
> +     - name: Overrides all device configuration with provided configurations (IDEMPOTENT)
> +       vyos.vyos.vyos_lldp_interfaces: *overridden
> +@@ -43,7 +43,7 @@
> +     - name: Assert that before dicts were correctly generated
> +       assert:
> +         that:
> +-          - "{{ overridden['after'] | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "overridden['after'] | symmetric_difference(result['before']) |length == 0"
> +
> +   always:
> +     - include_tasks: _remove_config.yaml
> +diff --git a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/replaced.yaml b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/replaced.yaml
> +index 17acf0654c..aadc379300 100644
> +--- a/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/replaced.yaml
> ++++ b/test/integration/targets/incidental_vyos_lldp_interfaces/tests/cli/replaced.yaml
> +@@ -33,17 +33,17 @@
> +     - name: Assert that correct set of commands were generated
> +       assert:
> +         that:
> +-          - "{{ replaced['commands'] | symmetric_difference(result['commands']) |length == 0 }}"
> ++          - "replaced['commands'] | symmetric_difference(result['commands']) |length == 0"
> +
> +     - name: Assert that before dicts are correctly generated
> +       assert:
> +         that:
> +-          - "{{ populate | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "populate | symmetric_difference(result['before']) |length == 0"
> +
> +     - name: Assert that after dict is correctly generated
> +       assert:
> +         that:
> +-          - "{{ replaced['after'] | symmetric_difference(result['after']) |length == 0 }}"
> ++          - "replaced['after'] | symmetric_difference(result['after']) |length == 0"
> +
> +     - name: Replace device configurations of listed LLDP interfaces with provided configurarions (IDEMPOTENT)
> +       vyos.vyos.vyos_lldp_interfaces: *replaced
> +@@ -57,7 +57,7 @@
> +     - name: Assert that before dict is correctly generated
> +       assert:
> +         that:
> +-          - "{{ replaced['after'] | symmetric_difference(result['before']) |length == 0 }}"
> ++          - "replaced['after'] | symmetric_difference(result['before']) |length == 0"
> +
> +   always:
> +     - include_tasks: _remove_config.yaml
> +diff --git a/test/integration/targets/include_vars/tasks/main.yml b/test/integration/targets/include_vars/tasks/main.yml
> +index db15ba3c5d..6fc4e85a33 100644
> +--- a/test/integration/targets/include_vars/tasks/main.yml
> ++++ b/test/integration/targets/include_vars/tasks/main.yml
> +@@ -15,7 +15,7 @@
> +     that:
> +       - "testing == 789"
> +       - "base_dir == 'environments/development'"
> +-      - "{{ included_one_file.ansible_included_var_files�| length }} == 1"
> ++      - "included_one_file.ansible_included_var_files�| length == 1"
> +       - "'vars/environments/development/all.yml' in included_one_file.ansible_included_var_files[0]"
> +
> + - name: include the vars/environments/development/all.yml and save results in all
> +@@ -51,7 +51,7 @@
> +   assert:
> +     that:
> +       - webapp_version is defined
> +-      - "'file_without_extension' in '{{ include_without_file_extension.ansible_included_var_files | join(' ') }}'"
> ++      - "'file_without_extension' in include_without_file_extension.ansible_included_var_files | join(' ')"
> +
> + - name: include every directory in vars
> +   include_vars:
> +@@ -67,7 +67,7 @@
> +       - "testing == 456"
> +       - "base_dir == 'services'"
> +       - "webapp_containers == 10"
> +-      - "{{ include_every_dir.ansible_included_var_files�| length }} == 7"
> ++      - "include_every_dir.ansible_included_var_files�| length == 7"
> +       - "'vars/all/all.yml' in include_every_dir.ansible_included_var_files[0]"
> +       - "'vars/environments/development/all.yml' in include_every_dir.ansible_included_var_files[1]"
> +       - "'vars/environments/development/services/webapp.yml' in include_every_dir.ansible_included_var_files[2]"
> +@@ -88,9 +88,9 @@
> +     that:
> +       - "testing == 789"
> +       - "base_dir == 'environments/development'"
> +-      - "{{ include_without_webapp.ansible_included_var_files�| length }} == 4"
> +-      - "'webapp.yml' not in '{{ include_without_webapp.ansible_included_var_files | join(' ') }}'"
> +-      - "'file_without_extension' not in '{{ include_without_webapp.ansible_included_var_files | join(' ') }}'"
> ++      - "include_without_webapp.ansible_included_var_files�| length == 4"
> ++      - "'webapp.yml' not in include_without_webapp.ansible_included_var_files | join(' ')"
> ++      - "'file_without_extension' not in include_without_webapp.ansible_included_var_files | join(' ')"
> +
> + - name: include only files matching webapp.yml
> +   include_vars:
> +@@ -104,9 +104,9 @@
> +       - "testing == 101112"
> +       - "base_dir == 'development/services'"
> +       - "webapp_containers == 20"
> +-      - "{{ include_match_webapp.ansible_included_var_files�| length }} == 1"
> ++      - "include_match_webapp.ansible_included_var_files�| length == 1"
> +       - "'vars/environments/development/services/webapp.yml' in include_match_webapp.ansible_included_var_files[0]"
> +-      - "'all.yml' not in '{{ include_match_webapp.ansible_included_var_files | join(' ') }}'"
> ++      - "'all.yml' not in include_match_webapp.ansible_included_var_files | join(' ')"
> +
> + - name: include only files matching webapp.yml and store results in webapp
> +   include_vars:
> +@@ -173,10 +173,10 @@
> + - name: Verify the hash variable
> +   assert:
> +     that:
> +-      - "{{ config | length }} == 3"
> ++      - "config | length == 3"
> +       - "config.key0 == 0"
> +       - "config.key1 == 0"
> +-      - "{{ config.key2 | length }} == 1"
> ++      - "config.key2 | length == 1"
> +       - "config.key2.a == 21"
> +
> + - name: Include the second file to merge the hash variable
> +@@ -187,10 +187,10 @@
> + - name: Verify that the hash is merged
> +   assert:
> +     that:
> +-      - "{{ config | length }} == 4"
> ++      - "config | length == 4"
> +       - "config.key0 == 0"
> +       - "config.key1 == 1"
> +-      - "{{ config.key2 | length }} == 2"
> ++      - "config.key2 | length == 2"
> +       - "config.key2.a == 21"
> +       - "config.key2.b == 22"
> +       - "config.key3 == 3"
> +@@ -202,9 +202,9 @@
> + - name: Verify that the properties from the first file is cleared
> +   assert:
> +     that:
> +-      - "{{ config | length }} == 3"
> ++      - "config | length == 3"
> +       - "config.key1 == 1"
> +-      - "{{ config.key2 | length }} == 1"
> ++      - "config.key2 | length == 1"
> +       - "config.key2.b == 22"
> +       - "config.key3 == 3"
> +
> +diff --git a/test/integration/targets/lookup_ini/test_lookup_properties.yml b/test/integration/targets/lookup_ini/test_lookup_properties.yml
> +index a6fc0f7d7c..ed34760092 100644
> +--- a/test/integration/targets/lookup_ini/test_lookup_properties.yml
> ++++ b/test/integration/targets/lookup_ini/test_lookup_properties.yml
> +@@ -10,7 +10,7 @@
> +         field_with_space: "{{lookup('ini', 'field.with.space  type=properties  file=lookup.properties')}}"
> +
> +     - assert:
> +-        that: "{{item}} is defined"
> ++        that: "item is defined"
> +       with_items: [ 'test1', 'test2', 'test_dot', 'field_with_space' ]
> +
> +     - name: "read ini value"
> +diff --git a/test/integration/targets/lookup_subelements/tasks/main.yml b/test/integration/targets/lookup_subelements/tasks/main.yml
> +index 9d93cf2096..7885347bb2 100644
> +--- a/test/integration/targets/lookup_subelements/tasks/main.yml
> ++++ b/test/integration/targets/lookup_subelements/tasks/main.yml
> +@@ -133,7 +133,7 @@
> +
> + - assert:
> +     that:
> +-      - "'{{ item.0.name }}' != 'carol'"
> ++      - "item.0.name != 'carol'"
> +   with_subelements:
> +     - "{{ users }}"
> +     - mysql.privs
> +@@ -220,5 +220,5 @@
> +
> + - assert:
> +     that:
> +-      - "'{{ user_alice }}' == 'localhost'"
> +-      - "'{{ user_bob }}' == 'db1'"
> ++      - "user_alice == 'localhost'"
> ++      - "user_bob == 'db1'"
> +diff --git a/test/integration/targets/loop_control/inner.yml b/test/integration/targets/loop_control/inner.yml
> +index 1c286fa460..976f196102 100644
> +--- a/test/integration/targets/loop_control/inner.yml
> ++++ b/test/integration/targets/loop_control/inner.yml
> +@@ -3,7 +3,7 @@
> +     that:
> +       - ansible_loop.index == ansible_loop.index0 + 1
> +       - ansible_loop.revindex == ansible_loop.revindex0 + 1
> +-      - ansible_loop.first == {{ ansible_loop.index == 1 }}
> +-      - ansible_loop.last == {{ ansible_loop.index == ansible_loop.length }}
> ++      - ansible_loop.first == (ansible_loop.index == 1)
> ++      - ansible_loop.last == (ansible_loop.index == ansible_loop.length)
> +       - ansible_loop.length == 3
> +       - ansible_loop.allitems|join(',') == 'first,second,third'
> +diff --git a/test/integration/targets/module_precedence/modules_test_multiple_roles.yml b/test/integration/targets/module_precedence/modules_test_multiple_roles.yml
> +index f4bd264957..182c2158e8 100644
> +--- a/test/integration/targets/module_precedence/modules_test_multiple_roles.yml
> ++++ b/test/integration/targets/module_precedence/modules_test_multiple_roles.yml
> +@@ -14,4 +14,4 @@
> +   - assert:
> +       that:
> +         - '"location" in result'
> +-        - 'result["location"] == "{{ expected_location}}"'
> ++        - 'result["location"] == expected_location'
> +diff --git a/test/integration/targets/module_precedence/modules_test_multiple_roles_reverse_order.yml b/test/integration/targets/module_precedence/modules_test_multiple_roles_reverse_order.yml
> +index 5403ae238c..ec5619f39e 100644
> +--- a/test/integration/targets/module_precedence/modules_test_multiple_roles_reverse_order.yml
> ++++ b/test/integration/targets/module_precedence/modules_test_multiple_roles_reverse_order.yml
> +@@ -13,4 +13,4 @@
> +   - assert:
> +       that:
> +         - '"location" in result'
> +-        - 'result["location"] == "{{ expected_location}}"'
> ++        - 'result["location"] == expected_location'
> +diff --git a/test/integration/targets/module_precedence/multiple_roles/bar/tasks/main.yml b/test/integration/targets/module_precedence/multiple_roles/bar/tasks/main.yml
> +index 52c3402013..62b38a7cb5 100644
> +--- a/test/integration/targets/module_precedence/multiple_roles/bar/tasks/main.yml
> ++++ b/test/integration/targets/module_precedence/multiple_roles/bar/tasks/main.yml
> +@@ -7,4 +7,4 @@
> +   assert:
> +     that:
> +       - '"location" in result'
> +-      - 'result["location"] == "{{ expected_location }}"'
> ++      - 'result["location"] == expected_location'
> +diff --git a/test/integration/targets/module_precedence/multiple_roles/foo/tasks/main.yml b/test/integration/targets/module_precedence/multiple_roles/foo/tasks/main.yml
> +index 52c3402013..62b38a7cb5 100644
> +--- a/test/integration/targets/module_precedence/multiple_roles/foo/tasks/main.yml
> ++++ b/test/integration/targets/module_precedence/multiple_roles/foo/tasks/main.yml
> +@@ -7,4 +7,4 @@
> +   assert:
> +     that:
> +       - '"location" in result'
> +-      - 'result["location"] == "{{ expected_location }}"'
> ++      - 'result["location"] == expected_location'
> +diff --git a/test/integration/targets/script/tasks/main.yml b/test/integration/targets/script/tasks/main.yml
> +index 989513d531..74189f817d 100644
> +--- a/test/integration/targets/script/tasks/main.yml
> ++++ b/test/integration/targets/script/tasks/main.yml
> +@@ -198,7 +198,7 @@
> +   assert:
> +     that:
> +       - _check_mode_test2 is skipped
> +-      - '_check_mode_test2.msg == "{{ remote_tmp_dir_test | expanduser }}/afile2.txt exists, matching creates option"'
> ++      - '_check_mode_test2.msg == remote_tmp_dir_test | expanduser ~ "/afile2.txt exists, matching creates option"'
> +
> + - name: Remove afile2.txt
> +   file:
> +@@ -220,7 +220,7 @@
> +   assert:
> +     that:
> +       - _check_mode_test3 is skipped
> +-      - '_check_mode_test3.msg == "{{ remote_tmp_dir_test | expanduser }}/afile2.txt does not exist, matching removes option"'
> ++      - '_check_mode_test3.msg == remote_tmp_dir_test | expanduser ~ "/afile2.txt does not exist, matching removes option"'
> +
> + # executable
> +
> +diff --git a/test/integration/targets/slurp/tasks/main.yml b/test/integration/targets/slurp/tasks/main.yml
> +index 939859415a..f8ebb1594c 100644
> +--- a/test/integration/targets/slurp/tasks/main.yml
> ++++ b/test/integration/targets/slurp/tasks/main.yml
> +@@ -33,7 +33,7 @@
> +       - 'slurp_existing.encoding == "base64"'
> +       - 'slurp_existing is not changed'
> +       - 'slurp_existing is not failed'
> +-      - '"{{ slurp_existing.content | b64decode }}" == "We are at the caf�"'
> ++      - 'slurp_existing.content | b64decode == "We are at the caf�"'
> +
> + - name: Create a binary file to test with
> +   copy:
> +diff --git a/test/integration/targets/template/tasks/main.yml b/test/integration/targets/template/tasks/main.yml
> +index c0d2e11a65..3c91734b09 100644
> +--- a/test/integration/targets/template/tasks/main.yml
> ++++ b/test/integration/targets/template/tasks/main.yml
> +@@ -357,7 +357,7 @@
> + - assert:
> +     that:
> +       - "\"foo t'e~m\\plated\" in unusual_results.stdout_lines"
> +-      - "{{unusual_results.stdout_lines| length}} == 1"
> ++      - "unusual_results.stdout_lines| length == 1"
> +
> + - name: check that the unusual filename can be checked for changes
> +   template:
> +diff --git a/test/integration/targets/unarchive/tasks/test_missing_binaries.yml b/test/integration/targets/unarchive/tasks/test_missing_binaries.yml
> +index 58d38f4f91..49f862b46f 100644
> +--- a/test/integration/targets/unarchive/tasks/test_missing_binaries.yml
> ++++ b/test/integration/targets/unarchive/tasks/test_missing_binaries.yml
> +@@ -66,7 +66,7 @@
> +           - zip_success.changed
> +           # Verify that file list is generated
> +           - "'files' in zip_success"
> +-          - "{{zip_success['files']| length}} == 3"
> ++          - "zip_success['files']| length == 3"
> +           - "'foo-unarchive.txt' in zip_success['files']"
> +           - "'foo-unarchive-777.txt' in zip_success['files']"
> +           - "'FOO-UNAR.TXT' in zip_success['files']"
> +diff --git a/test/integration/targets/unarchive/tasks/test_mode.yml b/test/integration/targets/unarchive/tasks/test_mode.yml
> +index c69e3bd2b2..06fbc7b8d9 100644
> +--- a/test/integration/targets/unarchive/tasks/test_mode.yml
> ++++ b/test/integration/targets/unarchive/tasks/test_mode.yml
> +@@ -24,7 +24,7 @@
> +       - "unarchive06_stat.stat.mode == '0600'"
> +       # Verify that file list is generated
> +       - "'files' in unarchive06"
> +-      - "{{unarchive06['files']| length}} == 1"
> ++      - "unarchive06['files']| length == 1"
> +       - "'foo-unarchive.txt' in unarchive06['files']"
> +
> + - name: remove our tar.gz unarchive destination
> +@@ -74,7 +74,7 @@
> +       - "unarchive07.changed == false"
> +       # Verify that file list is generated
> +       - "'files' in unarchive07"
> +-      - "{{unarchive07['files']| length}} == 1"
> ++      - "unarchive07['files']| length == 1"
> +       - "'foo-unarchive.txt' in unarchive07['files']"
> +
> + - name: remove our tar.gz unarchive destination
> +@@ -108,7 +108,7 @@
> +       - "unarchive08_stat.stat.mode == '0601'"
> +       # Verify that file list is generated
> +       - "'files' in unarchive08"
> +-      - "{{unarchive08['files']| length}} == 3"
> ++      - "unarchive08['files']| length == 3"
> +       - "'foo-unarchive.txt' in unarchive08['files']"
> +       - "'foo-unarchive-777.txt' in unarchive08['files']"
> +       - "'FOO-UNAR.TXT' in unarchive08['files']"
> +@@ -140,7 +140,7 @@
> +       - "unarchive08_stat.stat.mode == '0601'"
> +       # Verify that file list is generated
> +       - "'files' in unarchive08"
> +-      - "{{unarchive08['files']| length}} == 3"
> ++      - "unarchive08['files']| length == 3"
> +       - "'foo-unarchive.txt' in unarchive08['files']"
> +       - "'foo-unarchive-777.txt' in unarchive08['files']"
> +       - "'FOO-UNAR.TXT' in unarchive08['files']"
> +diff --git a/test/integration/targets/unarchive/tasks/test_unprivileged_user.yml b/test/integration/targets/unarchive/tasks/test_unprivileged_user.yml
> +index 8ee1db49e4..9f45e4c991 100644
> +--- a/test/integration/targets/unarchive/tasks/test_unprivileged_user.yml
> ++++ b/test/integration/targets/unarchive/tasks/test_unprivileged_user.yml
> +@@ -40,7 +40,7 @@
> +           - unarchive10 is changed
> +           # Verify that file list is generated
> +           - "'files' in unarchive10"
> +-          - "{{unarchive10['files']| length}} == 1"
> ++          - "unarchive10['files']| length == 1"
> +           - "'foo-unarchive.txt' in unarchive10['files']"
> +           - archive_path.stat.exists
> +
> +diff --git a/test/integration/targets/unarchive/tasks/test_zip.yml b/test/integration/targets/unarchive/tasks/test_zip.yml
> +index cf03946fcd..0fc5dc9ce6 100644
> +--- a/test/integration/targets/unarchive/tasks/test_zip.yml
> ++++ b/test/integration/targets/unarchive/tasks/test_zip.yml
> +@@ -17,7 +17,7 @@
> +       - "unarchive03.changed == true"
> +       # Verify that file list is generated
> +       - "'files' in unarchive03"
> +-      - "{{unarchive03['files']| length}} == 3"
> ++      - "unarchive03['files']| length == 3"
> +       - "'foo-unarchive.txt' in unarchive03['files']"
> +       - "'foo-unarchive-777.txt' in unarchive03['files']"
> +       - "'FOO-UNAR.TXT' in unarchive03['files']"
> +diff --git a/test/integration/targets/wait_for/tasks/main.yml b/test/integration/targets/wait_for/tasks/main.yml
> +index f71ddbda6b..f81fd0f246 100644
> +--- a/test/integration/targets/wait_for/tasks/main.yml
> ++++ b/test/integration/targets/wait_for/tasks/main.yml
> +@@ -40,7 +40,7 @@
> +   assert:
> +     that:
> +       - waitfor is successful
> +-      - waitfor.path == "{{ remote_tmp_dir | expanduser }}/wait_for_file"
> ++      - waitfor.path == remote_tmp_dir | expanduser ~ "/wait_for_file"
> +       - waitfor.elapsed >= 2
> +       - waitfor.elapsed <= 15
> +
> +@@ -58,7 +58,7 @@
> +   assert:
> +     that:
> +       - waitfor is successful
> +-      - waitfor.path == "{{ remote_tmp_dir | expanduser }}/wait_for_file"
> ++      - waitfor.path == remote_tmp_dir | expanduser ~ "/wait_for_file"
> +       - waitfor.elapsed >= 2
> +       - waitfor.elapsed <= 15
> +
> +@@ -156,7 +156,7 @@
> +     that:
> +       - waitfor is successful
> +       - waitfor is not changed
> +-      - "waitfor.port == {{ http_port }}"
> ++      - "waitfor.port == http_port"
> +
> + - name: install psutil using pip (non-Linux only)
> +   pip:
> +@@ -184,7 +184,7 @@
> +     that:
> +       - waitfor is successful
> +       - waitfor is not changed
> +-      - "waitfor.port == {{ http_port }}"
> ++      - "waitfor.port == http_port"
> +
> + - name: test wait_for with delay
> +   wait_for:
> +diff --git a/test/units/parsing/yaml/test_dumper.py b/test/units/parsing/yaml/test_dumper.py
> +index 5fbc139ba0..cbf5b45646 100644
> +--- a/test/units/parsing/yaml/test_dumper.py
> ++++ b/test/units/parsing/yaml/test_dumper.py
> +@@ -29,7 +29,6 @@ from ansible.parsing.yaml import dumper, objects
> + from ansible.parsing.yaml.loader import AnsibleLoader
> + from ansible.module_utils.six import PY2
> + from ansible.template import AnsibleUndefined
> +-from ansible.utils.unsafe_proxy import AnsibleUnsafeText, AnsibleUnsafeBytes
> +
> + from units.mock.yaml_helper import YamlTestUtils
> + from units.mock.vault_helper import TextVaultSecret
> +@@ -69,8 +68,7 @@ class TestAnsibleDumper(unittest.TestCase, YamlTestUtils):
> +
> +     def test_bytes(self):
> +         b_text = u'tr�ma'.encode('utf-8')
> +-        unsafe_object = AnsibleUnsafeBytes(b_text)
> +-        yaml_out = self._dump_string(unsafe_object, dumper=self.dumper)
> ++        yaml_out = self._dump_string(b_text, dumper=self.dumper)
> +
> +         stream = self._build_stream(yaml_out)
> +         loader = self._loader(stream)
> +@@ -97,8 +95,7 @@ class TestAnsibleDumper(unittest.TestCase, YamlTestUtils):
> +
> +     def test_unicode(self):
> +         u_text = u'n�el'
> +-        unsafe_object = AnsibleUnsafeText(u_text)
> +-        yaml_out = self._dump_string(unsafe_object, dumper=self.dumper)
> ++        yaml_out = self._dump_string(u_text, dumper=self.dumper)
> +
> +         stream = self._build_stream(yaml_out)
> +         loader = self._loader(stream)
> +--
> +2.40.0
> diff --git a/recipes-devtools/python/python3-ansible_2.14.11.bb b/recipes-devtools/python/python3-ansible_2.14.11.bb
> index f3ab2377..f57ef6f8 100644
> --- a/recipes-devtools/python/python3-ansible_2.14.11.bb
> +++ b/recipes-devtools/python/python3-ansible_2.14.11.bb
> @@ -9,4 +9,5 @@ RDEPENDS:${PN} += "python3-pyyaml \
>  
>  SRC_URI += " \
>      file://python3-ensure-py-scripts-use-py3-for-shebang.patch \
> +    file://CVE-2023-5764.patch \
>  "
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9236): https://lists.yoctoproject.org/g/meta-virtualization/message/9236
> Mute This Topic: https://lists.yoctoproject.org/mt/112448815/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


