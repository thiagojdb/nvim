local home = os.getenv "HOME"
local root_markers = { 'gradlew', '.git' }
local root_dir = require('jdtls.setup').find_root(root_markers)
local workspace_folder = home .. "/.local/share/eclipse/" .. vim.fn.fnamemodify(root_dir, ":p:h:t")

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local java_debug_path = vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/*.jar"
    , 1)
local jdtls_bundles = {
    java_debug_path
};

vim.list_extend(jdtls_bundles,
    vim.split(vim.fn.glob(home .. "/.local/share/nvim/mason/packages/java-test/extension/server/*.jar", 1), "\n"))

local config = {
    cmd = {
        'java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        "-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        '-jar',
        '/home/thiago/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_1.6.400.v20210924-0641.jar',
        '-configuration', '/home/thiago/.local/share/nvim/mason/packages/jdtls/config_linux',
        '-data', workspace_folder
    },
    root_dir = require('jdtls.setup').find_root({ '.git', 'mvnw', 'gradlew' }),
    settings = {
        java = {
            completion = {
                favoriteStaticMembers = {
                    "org.hamcrest.MatcherAssert.assertThat",
                    "org.hamcrest.Matchers.*",
                    "org.hamcrest.CoreMatchers.*",
                    "org.junit.jupiter.api.Assertions.*",
                    "java.util.Objects.requireNonNull",
                    "java.util.Objects.requireNonNullElse",
                    "org.mockito.Mockito.*"
                },
                filteredTypes = {
                    "com.sun.*",
                    "io.micrometer.shaded.*",
                    "java.awt.*",
                    "jdk.*",
                    "sun.*",
                },
            };
            configuration = {
                runtimes = {
                    {
                        name = "JavaSE-1.8",
                        path = "/usr/lib/jvm/java-8-openjdk-amd64/",
                    },
                    {
                        name = "JavaSE-11",
                        path = "/usr/lib/jvm/java-11-openjdk-amd64/",
                    },
                    {
                        name = "JavaSE-17",
                        path = "/usr/lib/jvm/java-17-openjdk-amd64/",
                    },
                }
            },
            maven = {
                downloadSources = true,
            },
            implementationsCodeLens = {
                enabled = true,
            },
            referencesCodeLens = {
                enabled = true,
            },
            references = {
                includeDecompiledSources = true,
            },
            format = {
                enabled = true,
            },
            codeGeneration = {
                toString = {
                    template = "${object.className}{${member.name()}=${member.value}, ${otherMembers}}",
                },
                useBlocks = true,
            },
            flags = {
                allow_incremental_sync = true,
            }
        }
    },
    on_attach = function(client, bufnr)
        require('user.lsp_keymaps').do_map_keys(bufnr);
        vim.api.nvim_create_user_command('JdtCompile', function()
            require('jdtls').compile('full')
        end, { nargs = 0 })

        vim.api.nvim_create_user_command('JdtUpdateConfig', function()
            require('jdtls').update_project_config()
        end, { nargs = 0 })

        require('jdtls').setup_dap({ hotcodereplace = 'auto' })
        require('dap.ext.vscode').load_launchjs()
    end,
    init_options = {
        bundles = jdtls_bundles,
        usePlaceholders = true
    },
    capabilities = capabilities

}

require('jdtls').start_or_attach(config);
