import type { TuiPluginModule, TuiPluginApi } from "@opencode-ai/plugin/tui";

export const tui: TuiPluginModule["tui"] = async (api, _options, _meta) => {
  api.command.register(() => [
    {
      title: "Pricing",
      value: "Show model pricing",
      description: "List all available models with their token pricing",
      category: "models",
      slash: {
        name: "pricing",
        aliases: ["model-costs", "model-prices", "costs"],
      },
      onSelect: () => showPricing(api),
    },
    {
      title: "Models (with pricing)",
      value: "List models with pricing",
      description: "List all available models with their pricing info",
      category: "models",
      suggested: true,
      slash: {
        name: "models",
        aliases: [],
      },
      onSelect: () => showPricing(api),
    },
  ]);
};

function showPricing(api: TuiPluginApi) {
  const providers = [...api.state.provider];

  const options: {
    title: string;
    value: string;
    description: string;
    footer: string;
    category: string;
  }[] = [];

  for (const provider of providers) {
    const models = Object.values(provider.models);
    if (models.length === 0) continue;

    for (const model of models) {
      options.push({
        title: model.name ?? model.id,
        value: `${provider.id}/${model.id}`,
        description: model.id,
        footer: formatFooter(model.cost),
        category: provider.name ?? provider.id,
      });
    }
  }

  api.ui.dialog.replace(() =>
    api.ui.DialogSelect({
      title: "Model Pricing",
      options,
      flat: false,
    }),
  );
}

function formatFooter(cost: {
  input: number;
  output: number;
  cache?: { read: number; write: number };
}): string {
  if (cost.input === 0 && cost.output === 0) {
    return "Free";
  }

  const parts: string[] = [];
  parts.push(`In $${cost.input.toFixed(2)}/1M`);
  parts.push(`Out $${cost.output.toFixed(2)}/1M`);

  if (cost.cache?.read && cost.cache.read > 0) {
    parts.push(`CR $${cost.cache.read.toFixed(2)}/1M`);
  }

  return parts.join(" | ");
}
